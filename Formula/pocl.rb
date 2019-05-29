class Pocl < Formula
  desc "MIT-licensed open source implementation of the OpenCL standard"
  homepage "http://portablecl.org/"
  url "https://github.com/pocl/pocl/archive/v1.3.tar.gz"
  sha256 "6527e3f47fab7c21e96bc757c4ae3303901f35e23f64642d6da5cc4c4fcc915a"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build

  depends_on "llvm"
  depends_on "hwloc"
  depends_on "libtool"

  def install
    mkdir "build" do 
      cmake_args = std_cmake_args
      cmake_args << "-DWITH_LLVM_CONFIG=#{Formula["llvm"].opt_bin}/llvm-config"
      cmake_args << "-DCMAKE_FIND_FRAMEWORK=NEVER" # Don't use MacOS frameworks
      system "cmake", "..", *cmake_args
      system "make"
      system "make", "install"
    end
  end
end
