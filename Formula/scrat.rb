# typed: true
# frozen_string_literal: true

class Scrat < Formula
  desc "Release management tooling focused on sanity retention"
  homepage "https://github.com/claylo/scrat"
  version "0.1.4"
  license "Apache-2.0 OR MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/scrat/releases/download/v0.1.4/scrat-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "59610194b4cedd6541db0c200ab9b7a0e2a8485e9f6c577f921f884f92f5ffa5"
    else
      url "https://github.com/claylo/scrat/releases/download/v0.1.4/scrat-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c44ff3c0a5cee0ca952db249ad018a5994c8518852ecdb00bc5be29c9180f875"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/scrat/releases/download/v0.1.4/scrat-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4dcdfc01f09b8a0287796f5359c167b0a37a7405f5f134f385c4a0a0c4a4b26f"
    else
      url "https://github.com/claylo/scrat/releases/download/v0.1.4/scrat-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0229e63769f4b2817e6a03995d2e8aa27809657be3dd2dc3b4f75bfc923032e"
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
