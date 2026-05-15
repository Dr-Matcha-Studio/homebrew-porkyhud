class Porkyhud < Formula
  include Language::Python::Shebang

  desc "Terminal-first Apple Silicon system HUD for macOS"
  homepage "https://github.com/Mengjiehasaheart/PorkyHUD"
  url "https://github.com/Mengjiehasaheart/PorkyHUD/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8ca3c0f82c43aa9aec31f1b555b64e37571eaf7a29f24136ecf703df4f6800d2"
  license "MIT"
  head "https://github.com/Mengjiehasaheart/PorkyHUD.git", branch: "main"

  depends_on :macos
  depends_on "python@3.14"

  def install
    bin.install "porkyhud.py" => "porkyhud"
    rewrite_shebang detected_python_shebang, bin/"porkyhud"

    pkgshare.install "PorkyHUD.command"
    pkgshare.install "assets" if (buildpath/"assets").directory?
  end

  test do
    assert_match "PorkyHUD 0.1.0", shell_output("#{bin}/porkyhud --version")
    assert_match "PorkyHUD snapshot", shell_output("#{bin}/porkyhud --snapshot")
  end
end
