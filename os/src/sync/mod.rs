//! Synchronization and interior mutability primitives
mod interrupt;
pub use interrupt::{interrupt_get, interrupt_off, interrupt_on};
