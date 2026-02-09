# Homebrew tap management

# Create a placeholder formula for a new Rust CLI tool.
# The bump-homebrew-formula-action will replace url + sha256 on first release.
# Usage: just new-formula bito-lint "Quality gate tooling" MIT
new-formula name desc license="MIT":
    #!/usr/bin/env bash
    set -euo pipefail
    class_name=$(echo "{{name}}" | perl -pe 's/(^|-)(.)/uc($2)/ge')
    formula="Formula/{{name}}.rb"
    if [[ -f "$formula" ]]; then
        echo "Formula already exists: $formula" >&2
        exit 1
    fi
    sed -e "s/__CLASS__/${class_name}/g" \
        -e "s/__NAME__/{{name}}/g" \
        -e "s/__DESC__/{{desc}}/g" \
        -e "s/__LICENSE__/{{license}}/g" \
        template.rb > "$formula"
    echo "Created $formula"
