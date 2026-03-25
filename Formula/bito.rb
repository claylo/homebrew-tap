# typed: true
# frozen_string_literal: true

class Bito < Formula
  desc "Quality gate tooling for building-in-the-open artifacts"
  homepage "https://github.com/claylo/bito"
  version "1.0.0"
  license "Apache-2.0 OR MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/bito/releases/download/v1.0.0/bito-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 ""
    else
      url "https://github.com/claylo/bito/releases/download/v1.0.0/bito-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/bito/releases/download/v1.0.0/bito-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    else
      url "https://github.com/claylo/bito/releases/download/v1.0.0/bito-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "bin/bito"
    man1.install Dir["share/man/man1/*.1"]
    bash_completion.install "share/completions/bito.bash" => "bito"
    zsh_completion.install "share/completions/_bito"
    fish_completion.install "share/completions/bito.fish"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/bito --version-only")
  end
end
