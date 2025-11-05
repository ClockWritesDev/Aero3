module aero3::utils::mem;
import std::core::mem;

macro void* AeroAlloc(byte_size) {
    void* alloc_ptr = mem::malloc(byte_size) 
    if (alloc_ptr == null) {
        
    } else {
        return result;
    }
}

macro void AeroMemCpy(dst, src, len) {

    mem::memcpy(dst, src, len);
}

macro void AeroFree(ptr) {
    
    mem::free(ptr);
}