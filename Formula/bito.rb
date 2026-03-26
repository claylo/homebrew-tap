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
      sha256 "706362e68cd2279bfd772576c1cd7e4745a8b2567f6107e6f893664d295978c9"
    else
      url "https://github.com/claylo/bito/releases/download/v1.0.0/bito-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "19490d97efcd09167a21820eabe89d71cbbddc61b76de2263fb95e55867261f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/bito/releases/download/v1.0.0/bito-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a267875f0ce4dfa4c358610831fedf811e60d9aac83fc63ce51e41827dc8805f"
    else
      url "https://github.com/claylo/bito/releases/download/v1.0.0/bito-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d22cb522185cd65841627e288181bd15de2613c7d7505742e50b61f33fff2f5"
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
