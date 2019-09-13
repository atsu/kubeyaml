// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/chuckha/cluster-api/api/core/v1alpha2

package v1alpha2

import (
	capierrors "github.com/chuckha/cluster-api/errors"
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// MachineFinalizer is set on PrepareForCreate callback.
MachineFinalizer: "machine.cluster.x-k8s.io"

// MachineClusterLabelName is the label set on machines linked to a cluster.
MachineClusterLabelName: "cluster.x-k8s.io/cluster-name"

// MachineControlPlaneLabelName is the label set on machines part of a control plane.
MachineControlPlaneLabelName: "cluster.x-k8s.io/control-plane"

/// [MachineSpec]
// MachineSpec defines the desired state of Machine
MachineSpec: {
	// ObjectMeta will autopopulate the Node created. Use this to
	// indicate what labels, annotations, name prefix, etc., should be used
	// when creating the Node.
	// +optional
	metadata?: ObjectMeta @go(ObjectMeta)

	// Bootstrap is a reference to a local struct which encapsulates
	// fields to configure the Machine’s bootstrapping mechanism.
	bootstrap: Bootstrap @go(Bootstrap)

	// InfrastructureRef is a required reference to a custom resource
	// offered by an infrastructure provider.
	infrastructureRef: corev1.ObjectReference @go(InfrastructureRef)

	// Version defines the desired Kubernetes version.
	// This field is meant to be optionally used by bootstrap providers.
	// +optional
	version?: null | string @go(Version,*string)

	// ProviderID is the identification ID of the machine provided by the provider.
	// This field must match the provider ID as seen on the node object corresponding to this machine.
	// This field is required by higher level consumers of cluster-api. Example use case is cluster autoscaler
	// with cluster-api as provider. Clean-up logic in the autoscaler compares machines to nodes to find out
	// machines at provider which could not get registered as Kubernetes nodes. With cluster-api as a
	// generic out-of-tree provider for autoscaler, this field is required by autoscaler to be
	// able to have a provider view of the list of machines. Another list of nodes is queried from the k8s apiserver
	// and then a comparison is done to find out unregistered machines and are marked for delete.
	// This field will be set by the actuators and consumed by higher level entities like autoscaler that will
	// be interfacing with cluster-api as generic provider.
	// +optional
	providerID?: null | string @go(ProviderID,*string)
}

/// [MachineStatus]
// MachineStatus defines the observed state of Machine
MachineStatus: {
	// NodeRef will point to the corresponding Node if it exists.
	// +optional
	nodeRef?: null | corev1.ObjectReference @go(NodeRef,*corev1.ObjectReference)

	// LastUpdated identifies when this status was last observed.
	// +optional
	lastUpdated?: null | metav1.Time @go(LastUpdated,*metav1.Time)

	// Version specifies the current version of Kubernetes running
	// on the corresponding Node. This is meant to be a means of bubbling
	// up status from the Node to the Machine.
	// It is entirely optional, but useful for end-user UX if it’s present.
	// +optional
	version?: null | string @go(Version,*string)

	// ErrorReason will be set in the event that there is a terminal problem
	// reconciling the Machine and will contain a succinct value suitable
	// for machine interpretation.
	//
	// This field should not be set for transitive errors that a controller
	// faces that are expected to be fixed automatically over
	// time (like service outages), but instead indicate that something is
	// fundamentally wrong with the Machine's spec or the configuration of
	// the controller, and that manual intervention is required. Examples
	// of terminal errors would be invalid combinations of settings in the
	// spec, values that are unsupported by the controller, or the
	// responsible controller itself being critically misconfigured.
	//
	// Any transient errors that occur during the reconciliation of Machines
	// can be added as events to the Machine object and/or logged in the
	// controller's output.
	// +optional
	errorReason?: null | capierrors.MachineStatusError @go(ErrorReason,*capierrors.MachineStatusError)

	// ErrorMessage will be set in the event that there is a terminal problem
	// reconciling the Machine and will contain a more verbose string suitable
	// for logging and human consumption.
	//
	// This field should not be set for transitive errors that a controller
	// faces that are expected to be fixed automatically over
	// time (like service outages), but instead indicate that something is
	// fundamentally wrong with the Machine's spec or the configuration of
	// the controller, and that manual intervention is required. Examples
	// of terminal errors would be invalid combinations of settings in the
	// spec, values that are unsupported by the controller, or the
	// responsible controller itself being critically misconfigured.
	//
	// Any transient errors that occur during the reconciliation of Machines
	// can be added as events to the Machine object and/or logged in the
	// controller's output.
	// +optional
	errorMessage?: null | string @go(ErrorMessage,*string)

	// Addresses is a list of addresses assigned to the machine.
	// This field is copied from the infrastructure provider reference.
	// +optional
	addresses?: MachineAddresses @go(Addresses)

	// Phase represents the current phase of machine actuation.
	// E.g. Pending, Running, Terminating, Failed etc.
	// +optional
	phase?: string @go(Phase)

	// BootstrapReady is the state of the bootstrap provider.
	// +optional
	bootstrapReady: bool @go(BootstrapReady)

	// InfrastructureReady is the state of the infrastructure provider.
	// +optional
	infrastructureReady: bool @go(InfrastructureReady)
}

/// [Bootstrap]
// Bootstrap capsulates fields to configure the Machine’s bootstrapping mechanism.
Bootstrap: {
	// ConfigRef is a reference to a bootstrap provider-specific resource
	// that holds configuration details. The reference is optional to
	// allow users/operators to specify Bootstrap.Data without
	// the need of a controller.
	// +optional
	configRef?: null | corev1.ObjectReference @go(ConfigRef,*corev1.ObjectReference)

	// Data contains the bootstrap data, such as cloud-init details scripts.
	// If nil, the Machine should remain in the Pending state.
	// +optional
	data?: null | string @go(Data,*string)
}

/// [Machine]
// Machine is the Schema for the machines API
Machine: metav1.TypeMeta & {
	metadata?: metav1.ObjectMeta @go(ObjectMeta)
	spec?:     MachineSpec       @go(Spec)
	status?:   MachineStatus     @go(Status)
}

// MachineList contains a list of Machine
MachineList: metav1.TypeMeta & {
	metadata?: metav1.ListMeta @go(ListMeta)
	items: [...Machine] @go(Items,[]Machine)
}
