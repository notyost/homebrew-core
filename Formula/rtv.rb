class Rtv < Formula
  include Language::Python::Virtualenv

  desc "Command-line Reddit client"
  homepage "https://github.com/michael-lazar/rtv"
  url "https://github.com/michael-lazar/rtv/archive/v1.21.0.tar.gz"
  sha256 "7e6a8de7b3e05b93d135cd2aa869b3d20f6ec26073a586e3595cff7f2df1aafa"
  revision 2
  head "https://github.com/michael-lazar/rtv.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "3a969dd228fe35726e8f9e7a7543e6d9470cb5465bfbfe4b7465e60b63ad537b" => :high_sierra
    sha256 "50a60bec5656f57b5ed68a84e77655db0df8dc6e7f27618424ea39fcece4375e" => :sierra
    sha256 "992e14a4dd5ec10a78de48baf03c82c7de8123aacdd3993fc9d2fa82ed52e05f" => :el_capitan
  end

  depends_on "python"

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
                              "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", name
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/rtv", "--version"
  end
end
