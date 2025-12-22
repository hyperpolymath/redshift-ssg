;;; STATE.scm — shift-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define metadata
  '((version . "0.1.0") (updated . "2025-12-17") (project . "shift-ssg")))

(define current-position
  '((phase . "v0.1 - Initial Setup")
    (overall-completion . 40)
    (components
     ((rsr-compliance ((status . "complete") (completion . 100)))
      (scm-security ((status . "complete") (completion . 100)))
      (adapters ((status . "complete") (completion . 100)))
      (core-infrastructure ((status . "pending") (completion . 0)))
      (testing ((status . "pending") (completion . 0)))
      (documentation ((status . "in-progress") (completion . 25)))))))

(define blockers-and-issues
  '((critical ())
    (high-priority
     (("CI workflow needs implementation" . "cicd")))
    (medium-priority
     (("README content needed" . "documentation")
      ("Unit tests needed" . "testing")))))

(define critical-next-actions
  '((immediate
     (("Set up core adapter loading mechanism" . high)
      ("Create adapter test suite" . high)))
    (this-week
     (("Add README content" . medium)
      ("Set up Nix flake" . medium)))
    (next-milestone
     (("Implement MCP protocol integration" . high)
      ("Add CI testing for adapters" . medium)))))

(define roadmap
  '((v0.1.0 "Initial Setup"
     ((status . "in-progress")
      (target . "2025-Q1")
      (features
       ("RSR-compliant repository structure" . complete)
       ("SCM files and security policies" . complete)
       ("28 SSG adapters from poly-ssg-mcp" . complete)
       ("Core documentation" . in-progress)
       ("Basic testing infrastructure" . pending)))))
  '((v0.2.0 "Core Infrastructure"
     ((status . "planned")
      (target . "2025-Q2")
      (features
       ("Adapter loading and registry" . pending)
       ("MCP protocol integration" . pending)
       ("Configuration system" . pending)
       ("CLI interface" . pending)))))
  '((v0.3.0 "Testing & Polish"
     ((status . "planned")
      (target . "2025-Q3")
      (features
       ("Comprehensive test suite" . pending)
       ("Performance optimization" . pending)
       ("Documentation completion" . pending)
       ("Beta release" . pending)))))
  '((v1.0.0 "Stable Release"
     ((status . "planned")
      (target . "2025-Q4")
      (features
       ("Production-ready release" . pending)
       ("Full documentation" . pending)
       ("Community feedback integration" . pending))))))

(define session-history
  '((snapshots
     ((date . "2025-12-15") (session . "initial") (notes . "SCM files added"))
     ((date . "2025-12-17") (session . "security-review") (notes . "Fixed template placeholders, verified adapters, updated roadmap")))))

(define state-summary
  '((project . "shift-ssg") (completion . 40) (blockers . 0) (updated . "2025-12-17")))
