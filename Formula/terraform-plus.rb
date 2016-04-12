class TerraformPlus < Formula
  version "0.6.14+0.3"
  desc "A custom Terraform distro with extra plugins we use at Say Media"
  homepage "https://github.com/saymedia/terraform-plus"
  url "https://github.com/saymedia/terraform-plus/releases/download/v#{version}/terraform-plus-v#{version.to_s.sub! "+", "."}-darwin.tar.xz"
  sha256 "ce1261e4db85f4cd2da973c274efb1fba618b1c9dbd67cf5b7eed67594c9a2c9"

  depends_on :xz
  conflicts_with "terraform", :because => "terraform-plus overrides the terraform binary"

  def install
      bin.install Dir["terraform*"]
  end

  test do
      output = shell_output(bin/"terraform version")
      assert_match version.to_s, output
  end
end
