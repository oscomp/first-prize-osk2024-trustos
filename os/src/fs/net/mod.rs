use alloc::sync::Arc;

use super::{File, Kstat};

struct Socket;
pub fn make_socket() -> Arc<dyn File> {
    Arc::new(Socket {})
}

impl File for Socket {
    fn readable(&self) -> bool {
        false
    }
    fn fstat(&self) -> Kstat {
        unimplemented!()
    }
}
