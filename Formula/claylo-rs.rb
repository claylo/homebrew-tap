# typed: true
# frozen_string_literal: true

class ClayloRs < Formula
  desc "Production-ready Rust CLI scaffolding with updatable templates"
  homepage "https://github.com/claylo/claylo-rs"
  url "https://github.com/claylo/claylo-rs/archive/refs/tags/v1.0.0-beta.2.tar.gz"
  sha256 "33a0fef00fcd46c553695c97ab37f285a440e0a383930aeac7c164b7488e6dec"
  license "MIT"

  depends_on "bash" => :build
  depends_on "copier"

  def install
    inreplace "bin/claylo-rs", 'VERSION="devel"', "VERSION=\"#{version}\""
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
