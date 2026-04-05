# typed: true
# frozen_string_literal: true

class Scrat < Formula
  desc "Release management tooling focused on sanity retention"
  homepage "https://github.com/claylo/scrat"
  version "0.1.1"
  license "Apache-2.0 OR MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/scrat/releases/download/v0.1.1/scrat-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3a2c750f9be2812346b3fd53418ef4bab33c0c7cc1f9287abecdd5ae9bca5b51"
    else
      url "https://github.com/claylo/scrat/releases/download/v0.1.1/scrat-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b23c9509cb4aea33eba6975232bf34a14f010b483c7d0d167af4b7dee67e34d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/scrat/releases/download/v0.1.1/scrat-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b81cc3bb70792e585ceb6b0e3f828005b0fd7568d8c8132c9b8501326e75293"
    else
      url "https://github.com/claylo/scrat/releases/download/v0.1.1/scrat-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee304aee0a860202c95a3612b3fb7d749ce59988fda4817c9b283f6ac29998d8"
    end
  end

  def install
    bin.install "bin/scrat"
    man1.install Dir["share/man/man1/*.1"]
    bash_completion.install "share/completions/scrat.bash" => "scrat"
    zsh_completion.install "share/completions/_scrat"
    fish_completion.install "share/completions/scrat.fish"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/scrat --version-only")
  end
end
