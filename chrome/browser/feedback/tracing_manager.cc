// Copyright 2013 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "chrome/browser/feedback/tracing_manager.h"

#include "base/bind.h"
#include "base/prefs/pref_service.h"
#include "chrome/browser/browser_process.h"
#include "chrome/browser/feedback/feedback_util.h"
#include "chrome/common/pref_names.h"
#include "content/public/browser/trace_controller.h"

namespace {
// Only once trace manager can exist at a time.
TracingManager* g_tracing_manager = NULL;
// Trace IDs start at 1 and increase.
int g_next_trace_id = 1;
}

TracingManager::TracingManager()
    : current_trace_id_(0),
      weak_ptr_factory_(this) {
  DCHECK(!g_tracing_manager);
  g_tracing_manager = this;
  StartTracing();
}

TracingManager::~TracingManager() {
  DCHECK(g_tracing_manager == this);
  g_tracing_manager = NULL;
}

int TracingManager::RequestTrace() {
  // Return the current trace if one is being collected.
  if (current_trace_id_)
    return current_trace_id_;

  current_trace_id_ = g_next_trace_id;
  ++g_next_trace_id;
  content::TraceController::GetInstance()->EndTracingAsync(this);
  return current_trace_id_;
}

bool TracingManager::GetTraceData(int id, const TraceDataCallback& callback) {
  // If a trace is being collected currently, send it via callback when
  // complete.
  if (current_trace_id_) {
    // Only allow one trace data request at a time.
    if (trace_callback_.is_null()) {
      trace_callback_ = callback;
      return true;
    } else {
      return false;
    }
  } else {
    std::map<int, scoped_refptr<base::RefCountedString> >::iterator data =
        trace_data_.find(id);
    if (data == trace_data_.end())
      return false;

    // Always return the data asychronously, so the behavior is consistant.
    base::MessageLoopProxy::current()->PostTask(
        FROM_HERE,
        base::Bind(callback, data->second));
    return true;
  }
}

void TracingManager::DiscardTraceData(int id) {
  trace_data_.erase(id);

  // If the trace is discarded before it is complete, clean up the accumulators.
  if (id == current_trace_id_) {
    current_trace_id_ = 0;
    data_ = "";

    // If the trace has already been requested, provide an empty string.
    if (!trace_callback_.is_null()) {
      trace_callback_.Run(scoped_refptr<base::RefCountedString>());
      trace_callback_.Reset();
    }
  }
}

void TracingManager::StartTracing() {
  content::TraceController::GetInstance()->BeginTracing(
      this, "-test_*",
      base::debug::TraceLog::RECORD_CONTINUOUSLY);
}

void TracingManager::OnEndTracingComplete() {
  if (!current_trace_id_)
    return;

  std::string output_val;
  FeedbackUtil::ZipString(data_, &output_val);

  scoped_refptr<base::RefCountedString> output;
  output->TakeString(&output_val);

  trace_data_[current_trace_id_] = output;

  if (!trace_callback_.is_null()) {
    trace_callback_.Run(output);
    trace_callback_.Reset();
  }

  current_trace_id_ = 0;
  data_ = "";

  // Tracing has to be restarted asynchronous, so the TracingController can
  // clean up.
  base::MessageLoopProxy::current()->PostTask(
      FROM_HERE,
      base::Bind(&TracingManager::StartTracing,
                 weak_ptr_factory_.GetWeakPtr()));
}

void TracingManager::OnTraceDataCollected(
    const scoped_refptr<base::RefCountedString>& trace_fragment) {
  if (current_trace_id_)
    data_ += trace_fragment->data();
}

// static
scoped_ptr<TracingManager> TracingManager::Create() {
  if (g_tracing_manager)
    return scoped_ptr<TracingManager>();
  return scoped_ptr<TracingManager>(new TracingManager());
}

TracingManager* TracingManager::Get() {
  return g_tracing_manager;
}