// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/chuckha/cluster-api/errors

package errors

// Constants aren't automatically generated for unversioned packages.
// Instead share the same constant for all versioned packages
MachineStatusError: string // enumMachineStatusError

enumMachineStatusError:
	InvalidConfigurationMachineError |
	UnsupportedChangeMachineError |
	InsufficientResourcesMachineError |
	CreateMachineError |
	UpdateMachineError |
	DeleteMachineError

// Represents that the combination of configuration in the MachineSpec
// is not supported by this cluster. This is not a transient error, but
// indicates a state that must be fixed before progress can be made.
//
// Example: the ProviderSpec specifies an instance type that doesn't exist,
InvalidConfigurationMachineError: MachineStatusError & "InvalidConfiguration"

// This indicates that the MachineSpec has been updated in a way that
// is not supported for reconciliation on this cluster. The spec may be
// completely valid from a configuration standpoint, but the controller
// does not support changing the real world state to match the new
// spec.
//
// Example: the responsible controller is not capable of changing the
// container runtime from docker to rkt.
UnsupportedChangeMachineError: MachineStatusError & "UnsupportedChange"

// This generally refers to exceeding one's quota in a cloud provider,
// or running out of physical machines in an on-premise environment.
InsufficientResourcesMachineError: MachineStatusError & "InsufficientResources"

// There was an error while trying to create a Node to match this
// Machine. This may indicate a transient problem that will be fixed
// automatically with time, such as a service outage, or a terminal
// error during creation that doesn't match a more specific
// MachineStatusError value.
//
// Example: timeout trying to connect to GCE.
CreateMachineError: MachineStatusError & "CreateError"

// There was an error while trying to update a Node that this
// Machine represents. This may indicate a transient problem that will be
// fixed automatically with time, such as a service outage,
//
// Example: error updating load balancers
UpdateMachineError: MachineStatusError & "UpdateError"

// An error was encountered while trying to delete the Node that this
// Machine represents. This could be a transient or terminal error, but
// will only be observable if the provider's Machine controller has
// added a finalizer to the object to more gracefully handle deletions.
//
// Example: cannot resolve EC2 IP address.
DeleteMachineError: MachineStatusError & "DeleteError"

// This error indicates that the machine did not join the cluster
// as a new node within the expected timeframe after instance
// creation at the provider succeeded
//
// Example use case: A controller that deletes Machines which do
// not result in a Node joining the cluster within a given timeout
// and that are managed by a MachineSet
JoinClusterTimeoutMachineError: "JoinClusterTimeoutError"

ClusterStatusError: string // enumClusterStatusError

enumClusterStatusError:
	InvalidConfigurationClusterError |
	UnsupportedChangeClusterError |
	CreateClusterError |
	UpdateClusterError |
	DeleteClusterError

// InvalidConfigurationClusterError indicates that the cluster
// configuration is invalid.
InvalidConfigurationClusterError: ClusterStatusError & "InvalidConfiguration"

// UnsupportedChangeClusterError indicates that the cluster
// spec has been updated in an unsupported way. That cannot be
// reconciled.
UnsupportedChangeClusterError: ClusterStatusError & "UnsupportedChange"

// CreateClusterError indicates that an error was encountered
// when trying to create the cluster.
CreateClusterError: ClusterStatusError & "CreateError"

// UpdateClusterError indicates that an error was encountered
// when trying to update the cluster.
UpdateClusterError: ClusterStatusError & "UpdateError"

// DeleteClusterError indicates that an error was encountered
// when trying to delete the cluster.
DeleteClusterError: ClusterStatusError & "DeleteError"

MachineSetStatusError: string // enumMachineSetStatusError

enumMachineSetStatusError:
	InvalidConfigurationMachineSetError

// Represents that the combination of configuration in the MachineTemplateSpec
// is not supported by this cluster. This is not a transient error, but
// indicates a state that must be fixed before progress can be made.
//
// Example: the ProviderSpec specifies an instance type that doesn't exist.
InvalidConfigurationMachineSetError: MachineSetStatusError & "InvalidConfiguration"
