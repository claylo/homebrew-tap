# typed: true
# frozen_string_literal: true

class ClayloRs < Formula
  desc "Production-ready Rust CLI scaffolding with updatable templates"
  homepage "https://github.com/claylo/claylo-rs"
  url "https://github.com/claylo/claylo-rs/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "d8673c123420630c9b79081035be3ecce867b5c34dc8101d110e658290b710b7"
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
