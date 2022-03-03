//
//  steam_struct_shims.h
//  CSteamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.


#include <cstring>

__attribute__((swift_name("getter:IPCFailure_t.m_achName_ptr(self:)")))
static inline const char * _Nonnull IPCFailure_t_m_achName_ptr(const IPCFailure_t * _Nonnull s)
{
    const_cast<IPCFailure_t *>(s)->m_achName[199] = 0;
    return s->m_achName;
}

__attribute__((swift_name("getter:IPCFailure_t.m_abData_ptr(self:)")))
static inline const uint8 * _Nonnull IPCFailure_t_m_abData_ptr(const IPCFailure_t * _Nonnull s)
{
    return s->m_abData;
}

__attribute__((swift_name("getter:IPCFailure_t.m_aStruct_ptr(self:)")))
static inline const Something_t * _Nonnull IPCFailure_t_m_aStruct_ptr(const IPCFailure_t * _Nonnull s)
{
    return s->m_aStruct;
}
