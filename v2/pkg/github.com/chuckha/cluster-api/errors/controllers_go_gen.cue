// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/chuckha/cluster-api/errors

package errors

import (
	"time"
)

// HasRequeueAfterError represents that an actuator managed object should
// be requeued for further processing after the given RequeueAfter time has
// passed.
HasRequeueAfterError: _

// RequeueAfterError represents that an actuator managed object should be
// requeued for further processing after the given RequeueAfter time has
// passed.
RequeueAfterError: {
	RequeueAfter: time.Duration
}
