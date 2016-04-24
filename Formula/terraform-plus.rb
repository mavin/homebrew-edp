class TerraformPlus < Formula
  version "0.6.15+0.1"
  desc "A custom Terraform distro with extra plugins we use at Say Media"
  homepage "https://github.com/saymedia/terraform-plus"
  url "https://github.com/saymedia/terraform-plus/releases/download/v#{version}/terraform-plus-v#{version.to_s.sub! "+", "."}-darwin.tar.xz"
  sha256 "a2358ad1b5161f0eed570d095dc26f598a1dc9db9a1aa399cdd26de91f1bde04"

  depends_on "xz"
  conflicts_with "terraform", :because => "terraform-plus overrides the terraform binary"

  def install
      bin.install Dir["terraform*"]
  end

  test do
      output = shell_output(bin/"terraform version")
      assert_match version.to_s, output
  end
end
