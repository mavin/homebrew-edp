class TerraformPlus < Formula
  version "0.6.16+0.1"
  desc "A custom Terraform distro with extra plugins we use at Say Media"
  homepage "https://github.com/saymedia/terraform-plus"
  url "https://github.com/saymedia/terraform-plus/releases/download/v#{version}/terraform-plus-v#{version.to_s.sub! "+", "."}-darwin.tar.xz"
  sha256 "9810ae22302a759f8dae7871ba647e9d05cd2adc037bd8c8beac465fa3839f83"

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
