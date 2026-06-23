# AASC Hubble Transport Lean Audit

Standalone Lean 4 audit archive for the downstream Hubble paper:

`Transport Closure in Cosmological Inference and the Hubble Tension`

This repository packages the Hubble transport-closure Lean surface as a
downstream application of the reusable AASC framework.  It follows the same
publication/audit style as the AASC endpoint archives: manuscript-facing scope,
explicit imported-boundary language, focused Lean theorem anchors, and a local
verification script.

## Current Status

The strongest truthful claim for this archive is:

- `HubbleTransport` builds as a standalone Lake project.
- The reusable AASC machinery used by the Hubble module is included directly in
  this repository under `MaleyLean/`, copied from `somamaley-ux/AASC-REPOS` at
  the pinned source commit listed below.
- The formalized Hubble layer covers the redshift-active finite theorem object,
  not arbitrary cosmological extensions.
- The redshift-active transport map is represented as an AASC-typed object:
  anchor-preserving, tensor-witness, observable-facing, standing-bearing, and
  data-active.
- The seven-coordinate certificate is represented as a proof-carrying Lean
  structure over the declared ledger.
- The damping/recombination-suppression and zero-correction LCDM-limit hooks are
  exposed as theorem-level fields.
- Numerical Jacobian/SVD facts, convergence facts, and posterior statistics are
  imported as certificate evidence from the manuscript archive.  Lean does not
  re-run Cobaya, CAMB, MCMC, covariance whitening, or SVD.

## Main Lean Anchors

- `HubbleTransport.RedshiftActiveTransportMap`
- `HubbleTransport.TransportCoefficientTyping`
- `HubbleTransport.RedshiftActiveNumericalCertificate`
- `HubbleTransport.HubbleTransportObject`
- `HubbleTransport.hubble_redshift_active_transport_map_typed`
- `HubbleTransport.hubble_redshift_active_recombination_suppressed`
- `HubbleTransport.hubble_redshift_active_zero_correction_lcdm_limit`
- `HubbleTransport.hubble_redshift_active_instantiates_AASC_class`
- `HubbleTransport.hubble_redshift_active_kernel_package`
- `HubbleTransport.hubble_transport_closure_paper_recognized`
- `HubbleTransport.hubble_transport_closure_scope_boundary`

## Verification

Use:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/check-hubble-transport-audit.ps1
```

The audit runner:

- prints the Lean toolchain;
- prints the pinned dependency information;
- scans the Hubble Lean surface and axiom checks for live project-level `axiom`,
  `sorry`, `admit`, or `unsafe` declarations;
- builds `HubbleTransport`;
- runs the focused axiom-check entry point.

## Manuscript Snapshot

The manuscript PDF and source ZIP are retained under:

```text
papers/hubble/
```

The manuscript archive contains the redshift-active chain outputs, certificate
reports, validation ledgers, figures, and reproducibility materials.  Public
Planck and Pantheon+/SH0ES likelihood payloads are not redistributed unless the
manuscript package already includes permitted references or metadata.

## Formalization Scope

This repository should be read as a manuscript-faithful downstream AASC
mechanization.  It formalizes the typed theorem-object layer around the Hubble
transport closure certificate.  It does not claim:

- a universal all-basis transport certificate;
- exhaustion of all new-physics cosmological extensions;
- a full Planck `clik`/`clipy` production formalization;
- Bayesian evidence or model-selection preference;
- Lean formalization of MCMC posterior sampling itself.

The main value is that the Hubble paper can be presented as an application of a
machine-checked AASC framework, with the empirical/numerical certificate cleanly
separated from the reusable formal governance layer.

## Included AASC Support Spine

This standalone archive vendors the AASC support layer used by the Hubble
formalization:

```text
MaleyLean/
Main.lean
MaleyLean.lean
```

The vendored AASC snapshot was copied from:

```text
https://github.com/somamaley-ux/AASC-REPOS
commit ac7c291b5d990a45b63f30d03a465d37ec3347ae
```

The original upstream README and license are retained under:

```text
docs/upstream_aasc/
```
