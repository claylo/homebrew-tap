# typed: true
# frozen_string_literal: true

class BitoLint < Formula
  desc "Quality gate tooling for building-in-the-open artifacts"
  homepage "https://github.com/claylo/bito-lint"
  version "0.3.0"
  license "Apache-2.0 OR MIT"
  deprecate! date: "2026-03-25", because: "renamed to bito", replacement_formula: "bito"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/bito-lint/releases/download/v0.3.0/bito-lint-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 ""
    else
      url "https://github.com/claylo/bito-lint/releases/download/v0.3.0/bito-lint-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/bito-lint/releases/download/v0.3.0/bito-lint-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    else
      url "https://github.com/claylo/bito-lint/releases/download/v0.3.0/bito-lint-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "bin/bito-lint"
    man1.install Dir["share/man/man1/*.1"]
    bash_completion.install "share/completions/bito-lint.bash" => "bito-lint"
    zsh_completion.install "share/completions/_bito-lint"
    fish_completion.install "share/completions/bito-lint.fish"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/bito-lint --version-only")
  end
end
