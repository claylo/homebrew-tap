# typed: true
# frozen_string_literal: true

class ClayloRs < Formula
  desc "Production-ready Rust CLI scaffolding with updatable templates"
  homepage "https://github.com/claylo/claylo-rs"
  url "https://github.com/claylo/claylo-rs/archive/refs/tags/v1.0.0-alpha.4.tar.gz"
  sha256 "9ea37e30a340b81230cddfb661ff5122b3e15fb2d125591d052107e51918eede"
  license "MIT"

  depends_on "bash" => :build
  depends_on "copier"

  def install
    bin.install "bin/claylo-rs"
  end

  def caveats
    <<~EOS
      claylo-rs requires bash 4+ (provided by Homebrew's bash).
      The script will use Homebrew's bash automatically.

      Quick start:
        claylo-rs new ./my-tool --owner myorg --copyright "Your Name"
        claylo-rs new ./my-tool --preset full +otel
        claylo-rs update ./my-tool +mcp
    EOS
  end

  test do
    assert_match "Usage: claylo-rs", shell_output("#{bin}/claylo-rs --help")
  end
end
