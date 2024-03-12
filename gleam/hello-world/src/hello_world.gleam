import gleam/io

pub fn hello() {
  "Hello, World!"
}

pub fn main() {
  io.debug(hello())
}
