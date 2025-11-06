module aero3::utils::mem;
import std::core::mem;

macro void* aero3Alloc(byte_size) {
    void* alloc_ptr = mem::malloc(byte_size);
    if (alloc_ptr == null) {
        
    } else {
        return result;
    }
}

macro void aero3MemCpy(dst, src, len) {

    mem::memcpy(dst, src, len);
}

macro void aero3Free(ptr) {
    
    mem::free(ptr);
}