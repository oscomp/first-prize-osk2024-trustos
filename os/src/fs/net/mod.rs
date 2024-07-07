use alloc::sync::{Arc, Weak};

use super::File;

struct Socket;
pub fn make_socket() -> Arc<dyn File> {
    Arc::new(Socket {})
}

impl File for Socket {}
