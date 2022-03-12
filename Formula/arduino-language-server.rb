class ArduinoLanguageServer < Formula
  desc "An Arduino Language Server based on Clangd to Arduino code autocompletion"
  homepage "https://github.com/arduino/arduino-language-server"
  url "https://github.com/arduino/arduino-language-server/archive/refs/tags/0.6.0.tar.gz"
  sha256 "1af6d0fe939b9d4eb1988724fc6031142ee45332e8decce62586f84d847c80fd"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "arduino-cli"
  depends_on "llvm"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match /0.6.0/, shell_output("#{bin}/arduino-language-server -v")
  end
end
