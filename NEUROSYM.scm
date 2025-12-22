;;; NEUROSYM.scm — shift-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;; Neuro-symbolic reasoning patterns for shift-ssg

(define-module (shift-ssg neurosym)
  #:export (knowledge-graph reasoning-patterns semantic-types inference-rules))

;; ═══════════════════════════════════════════════════════════════════════════════
;; KNOWLEDGE GRAPH
;; ═══════════════════════════════════════════════════════════════════════════════

(define knowledge-graph
  '((entities
     ;; Project Entity
     ((shift-ssg
       ((type . project)
        (relationships
         (part-of . hyperpolymath-ecosystem)
         (satellite-of . poly-ssg-mcp)
         (follows . rhodium-standard-repositories)))
        (properties
         ((language . "JavaScript/TypeScript")
          (runtime . "Deno")
          (adapter-count . 28)
          (license . "AGPL-3.0-or-later")))))

      ;; Adapter Entities (28)
      (adapters
       ((category . functional)
        (members . (babashka coleslaw pollen frog perun cryogen))
        (languages . (Clojure "Common Lisp" Racket)))
       ((category . statically-typed)
        (members . (cobalt mdbook fornax laika orchid zola))
        (languages . (Rust "F#" Scala Kotlin)))
       ((category . elixir-ecosystem)
        (members . (nimble-publisher serum tableau))
        (languages . (Elixir)))
       ((category . scientific)
        (members . (documenter franklin ema hakyll))
        (languages . (Julia Haskell))))

      ;; Tool Entities
      (build-tools
       ((justfile
         ((type . task-runner)
          (commands . (check test lint fmt build ci))))
        (mustfile
         ((type . compliance-checker)
          (commands . (build test lint security docs adapters ci))))))))

    (relationships
     ;; Adapter relationships
     ((adapter-implements . ((domain . adapter) (range . ssg-tool)))
      (adapter-uses . ((domain . adapter) (range . runtime)))
      (adapter-language . ((domain . adapter) (range . programming-language))))

     ;; Project relationships
     ((project-contains . ((domain . project) (range . component)))
      (project-follows . ((domain . project) (range . standard)))
      (component-depends-on . ((domain . component) (range . component)))))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; REASONING PATTERNS
;; ═══════════════════════════════════════════════════════════════════════════════

(define reasoning-patterns
  '((adapter-selection
     ((description . "Select appropriate adapter for SSG task")
      (input . ((ssg-tool . ?tool) (language-preference . ?lang)))
      (pattern
       (if (and (adapter-implements ?adapter ?tool)
                (adapter-language ?adapter ?lang))
           (select ?adapter)
           (find-alternative ?tool)))
      (output . selected-adapter)))

    (build-failure-diagnosis
     ((description . "Diagnose build failure cause")
      (input . ((error-message . ?error) (context . ?ctx)))
      (pattern
       (cond
         ((contains ?error "syntax")
          (diagnose 'syntax-error (extract-location ?error)))
         ((contains ?error "not found")
          (diagnose 'missing-dependency (extract-name ?error)))
         ((contains ?error "permission")
          (diagnose 'permission-error (extract-path ?error)))
         (else
          (diagnose 'unknown-error ?error))))
      (output . diagnosis)))

    (security-vulnerability-assessment
     ((description . "Assess security vulnerability severity")
      (input . ((vulnerability . ?vuln) (context . ?ctx)))
      (pattern
       (let ((cvss (calculate-cvss ?vuln ?ctx)))
         (cond
           ((>= cvss 9.0) 'critical)
           ((>= cvss 7.0) 'high)
           ((>= cvss 4.0) 'medium)
           (else 'low))))
      (output . severity-level)))

    (code-quality-inference
     ((description . "Infer code quality from metrics")
      (input . ((coverage . ?cov) (lint-errors . ?errs) (complexity . ?cmplx)))
      (pattern
       (and (>= ?cov 70)
            (< ?errs 10)
            (< ?cmplx 15)))
      (output . quality-assessment)))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; SEMANTIC TYPES
;; ═══════════════════════════════════════════════════════════════════════════════

(define semantic-types
  '((adapter
     ((description . "SSG adapter implementation")
      (attributes
       ((name . string)
        (language . programming-language)
        (description . string)
        (tools . (list-of tool-definition))
        (connected . boolean)))
      (constraints
       ((has-connect-method . required)
        (has-disconnect-method . required)
        (has-tools-export . required)))))

    (tool-definition
     ((description . "MCP tool definition")
      (attributes
       ((name . string)
        (description . string)
        (input-schema . json-schema)
        (execute . function)))))

    (build-command
     ((description . "Build system command")
      (attributes
       ((name . string)
        (recipe . string)
        (dependencies . (list-of build-command))
        (exit-code . integer)))))

    (security-policy
     ((description . "Security policy definition")
      (attributes
       ((reporting-methods . (list-of reporting-method))
        (response-timeline . timeline)
        (scope . scope-definition)
        (safe-harbour . boolean)))))

    (component-status
     ((description . "Project component status")
      (attributes
       ((name . string)
        (location . path)
        (status . (enum pending in-progress complete))
        (completion . percentage)))))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; INFERENCE RULES
;; ═══════════════════════════════════════════════════════════════════════════════

(define inference-rules
  '((adapter-completeness
     ((rule . "An adapter is complete if it has all required exports")
      (premises
       ((has-export ?adapter 'name)
        (has-export ?adapter 'language)
        (has-export ?adapter 'description)
        (has-export ?adapter 'connect)
        (has-export ?adapter 'disconnect)
        (has-export ?adapter 'tools)))
      (conclusion
       (adapter-complete ?adapter))))

    (build-ready
     ((rule . "Project is build-ready if syntax check passes")
      (premises
       ((for-all ?adapter (in adapters)
                 (syntax-valid ?adapter))))
      (conclusion
       (build-ready project))))

    (release-ready
     ((rule . "Project is release-ready if all quality gates pass")
      (premises
       ((build-ready project)
        (tests-pass project)
        (lint-clean project)
        (security-clean project)
        (documentation-complete project)))
      (conclusion
       (release-ready project))))

    (security-risk
     ((rule . "Security risk exists if vulnerable patterns detected")
      (premises
       ((or (contains-pattern ?file "eval(")
            (contains-pattern ?file "password\\s*=")
            (contains-pattern ?file "api[_-]?key\\s*="))))
      (conclusion
       (security-risk ?file))))

    (component-health
     ((rule . "Component is healthy if status is complete and no blockers")
      (premises
       ((component-status ?component 'complete)
        (not (has-blocker ?component))))
      (conclusion
       (component-healthy ?component))))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; SYMBOLIC OPERATIONS
;; ═══════════════════════════════════════════════════════════════════════════════

(define symbolic-operations
  '((unification
     ((description . "Unify patterns with data")
      (example
       ((pattern . (adapter ?name ?language))
        (data . (adapter "zola" "Rust"))
        (result . ((?name . "zola") (?language . "Rust")))))))

    (resolution
     ((description . "Resolve goals using inference rules")
      (example
       ((goal . (release-ready shift-ssg))
        (subgoals . ((build-ready shift-ssg)
                     (tests-pass shift-ssg)
                     (lint-clean shift-ssg)
                     (security-clean shift-ssg)
                     (documentation-complete shift-ssg)))))))

    (abduction
     ((description . "Generate explanations for observations")
      (example
       ((observation . (test-failure "zola_build"))
        (hypotheses . ((missing-binary "zola")
                       (invalid-config "config.toml")
                       (network-error "timeout")))))))

    (analogy
     ((description . "Apply patterns from similar cases")
      (example
       ((source . hakyll-adapter-implementation)
        (target . ema-adapter-implementation)
        (mapping . ((stack-command . stack-command)
                    (build-tool . build-tool)
                    (haskell-ecosystem . haskell-ecosystem)))))))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; NEURAL-SYMBOLIC INTERFACE
;; ═══════════════════════════════════════════════════════════════════════════════

(define neural-symbolic-interface
  '((embeddings
     ((adapter-embeddings
       ((description . "Vector representations of adapters")
        (dimensions . 768)
        (features . (language ecosystem complexity maturity))))
      (tool-embeddings
       ((description . "Vector representations of tools")
        (dimensions . 768)
        (features . (functionality dependencies risk-level))))))

    (neural-to-symbolic
     ((description . "Convert neural outputs to symbolic form")
      (operations
       ((classify-adapter . "Map embedding to adapter category")
        (extract-intent . "Parse natural language to logical form")
        (detect-pattern . "Identify code patterns from embeddings")))))

    (symbolic-to-neural
     ((description . "Convert symbolic form to neural inputs")
      (operations
       ((encode-rule . "Convert inference rule to embedding")
        (encode-query . "Convert logical query to prompt")
        (encode-context . "Convert knowledge graph to context")))))))
