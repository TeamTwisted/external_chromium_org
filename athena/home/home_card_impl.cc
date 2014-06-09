// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "athena/home/public/home_card.h"

#include "athena/home/app_list_view_delegate.h"
#include "athena/input/public/accelerator_manager.h"
#include "athena/input/public/input_manager.h"
#include "athena/screen/public/screen_manager.h"
#include "ui/app_list/pagination_model.h"
#include "ui/app_list/views/app_list_view.h"
#include "ui/aura/layout_manager.h"
#include "ui/aura/window.h"
#include "ui/wm/core/visibility_controller.h"
#include "ui/wm/core/window_animations.h"

namespace athena {
namespace {

HomeCard* instance = NULL;

class HomeCardLayoutManager : public aura::LayoutManager {
 public:
  explicit HomeCardLayoutManager(aura::Window* container)
      : container_(container) {}
  virtual ~HomeCardLayoutManager() {}

 private:
  // aura::LayoutManager:
  virtual void OnWindowResized() OVERRIDE { Layout(); }
  virtual void OnWindowAddedToLayout(aura::Window* child) OVERRIDE { Layout(); }
  virtual void OnWillRemoveWindowFromLayout(aura::Window* child) OVERRIDE {}
  virtual void OnWindowRemovedFromLayout(aura::Window* child) OVERRIDE {
    Layout();
  }
  virtual void OnChildWindowVisibilityChanged(aura::Window* child,
                                              bool visible) OVERRIDE {
    Layout();
  }
  virtual void SetChildBounds(aura::Window* child,
                              const gfx::Rect& requested_bounds) OVERRIDE {
    SetChildBoundsDirect(child, gfx::Rect(requested_bounds.size()));
  }

  void Layout() {
    const int kHomeCardHeight = 150;
    const int kHomeCardHorizontalMargin = 50;
    // Currently the home card is provided as a bubble and the bounds has to be
    // increased to cancel the shadow.
    // TODO(mukai): stops using the bubble and remove this.
    const int kHomeCardShadowWidth = 30;
    if (container_->children().size() < 1)
      return;
    aura::Window* home_card = container_->children()[0];
    if (!home_card->IsVisible())
      return;
    gfx::Rect screen_bounds = home_card->GetRootWindow()->bounds();
    gfx::Rect card_bounds = screen_bounds;
    card_bounds.Inset(kHomeCardHorizontalMargin,
                      screen_bounds.height() - kHomeCardHeight,
                      kHomeCardHorizontalMargin,
                      0);
    card_bounds.Inset(-kHomeCardShadowWidth, -kHomeCardShadowWidth);
    SetChildBoundsDirect(home_card, card_bounds);
  }

  aura::Window* container_;

  DISALLOW_COPY_AND_ASSIGN(HomeCardLayoutManager);
};

class HomeCardImpl : public HomeCard, public AcceleratorHandler {
 public:
  HomeCardImpl();
  virtual ~HomeCardImpl();

  void Init();

 private:
  enum Command {
    COMMAND_SHOW_HOME_CARD,
  };
  void InstallAccelerators();

  // AcceleratorHandler:
  virtual bool IsCommandEnabled(int command_id) const OVERRIDE { return true; }
  virtual bool OnAcceleratorFired(int command_id,
                                  const ui::Accelerator& accelerator) OVERRIDE {
    DCHECK_EQ(COMMAND_SHOW_HOME_CARD, command_id);
    home_card_widget_->Show();
    return true;
  }

  views::Widget* home_card_widget_;

  DISALLOW_COPY_AND_ASSIGN(HomeCardImpl);
};

HomeCardImpl::HomeCardImpl()
  : home_card_widget_(NULL) {
  DCHECK(!instance);
  instance = this;
}

HomeCardImpl::~HomeCardImpl() {
  DCHECK(instance);
  home_card_widget_->CloseNow();
  instance = NULL;
}

void HomeCardImpl::Init() {
  InstallAccelerators();

  aura::Window* container =
      ScreenManager::Get()->CreateContainer("HomeCardContainer");
  container->SetLayoutManager(new HomeCardLayoutManager(container));
  wm::SetChildWindowVisibilityChangesAnimated(container);

  app_list::AppListView* view = new app_list::AppListView(
      new AppListViewDelegate);
  view->InitAsBubbleAtFixedLocation(
      container,
      0 /* initial_apps_page */,
      gfx::Point(),
      views::BubbleBorder::FLOAT,
      true /* border_accepts_events */);
  home_card_widget_ = view->GetWidget();
  view->ShowWhenReady();
}

void HomeCardImpl::InstallAccelerators() {
  const AcceleratorData accelerator_data[] = {
      {TRIGGER_ON_PRESS, ui::VKEY_L, ui::EF_CONTROL_DOWN,
       COMMAND_SHOW_HOME_CARD, AF_NONE},
  };
  InputManager::Get()->GetAcceleratorManager()->RegisterAccelerators(
      accelerator_data, arraysize(accelerator_data), this);
}

}  // namespace

// static
HomeCard* HomeCard::Create() {
  (new HomeCardImpl())->Init();
  DCHECK(instance);
  return instance;
}

// static
void HomeCard::Shutdown() {
  DCHECK(instance);
  delete instance;
  instance = NULL;
}

}  // namespace athena
