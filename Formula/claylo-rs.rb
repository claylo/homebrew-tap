# typed: true
# frozen_string_literal: true

class ClayloRs < Formula
  desc "Production-ready Rust CLI scaffolding with updatable templates"
  homepage "https://github.com/claylo/claylo-rs"
  url "https://github.com/claylo/claylo-rs/archive/refs/tags/v1.0.0-alpha.2.tar.gz"
  sha256 "5926b712da4259b7f330e3a824aae7dd738b165d4fb005a1480d353dadc4b9a9"
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
