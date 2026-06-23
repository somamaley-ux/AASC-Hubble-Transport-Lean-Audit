# Hubble Manuscript Snapshot

This folder contains the manuscript-facing Hubble transport-closure paper
snapshot paired with the Lean audit surface in this repository.

Included files:

- `Transport_Closure_in_Cosmological_Inference_and_the_Hubble_Tension.pdf`
- `Transport_Closure_in_Cosmological_Inference_and_the_Hubble_Tension_source.zip`

The Lean repository treats the manuscript and its retained certificate archive
as the Hubble-specific theorem-object evidence.  The reusable AASC machinery is
imported separately through the pinned Lean dependency in `lakefile.toml`.

Scope language:

This is a certificate-bearing finite redshift-active theorem object over the
declared Planck-validation, DESI DR1, and calibrated Pantheon+SH0ES covariance
ledger.  It is not a universal all-basis transport theorem, not a model
selection result, and not a first-principles formalization of the full
cosmological inference pipeline.
