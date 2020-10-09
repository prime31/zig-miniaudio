pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_longlong;
pub const __uint64_t = c_ulonglong;
pub const __darwin_intptr_t = c_long;
pub const __darwin_natural_t = c_uint;
pub const __darwin_ct_rune_t = c_int;
const union_unnamed_1 = extern union {
    __mbstate8: [128]u8,
    _mbstateL: c_longlong,
};
pub const __mbstate_t = union_unnamed_1;
pub const __darwin_mbstate_t = __mbstate_t;
pub const __darwin_ptrdiff_t = c_long;
pub const __darwin_size_t = c_ulong;
pub const __darwin_va_list = __builtin_va_list;
pub const __darwin_wchar_t = c_int;
pub const __darwin_rune_t = __darwin_wchar_t;
pub const __darwin_wint_t = c_int;
pub const __darwin_clock_t = c_ulong;
pub const __darwin_socklen_t = __uint32_t;
pub const __darwin_ssize_t = c_long;
pub const __darwin_time_t = c_long;
pub const __darwin_blkcnt_t = __int64_t;
pub const __darwin_blksize_t = __int32_t;
pub const __darwin_dev_t = __int32_t;
pub const __darwin_fsblkcnt_t = c_uint;
pub const __darwin_fsfilcnt_t = c_uint;
pub const __darwin_gid_t = __uint32_t;
pub const __darwin_id_t = __uint32_t;
pub const __darwin_ino64_t = __uint64_t;
pub const __darwin_ino_t = __darwin_ino64_t;
pub const __darwin_mach_port_name_t = __darwin_natural_t;
pub const __darwin_mach_port_t = __darwin_mach_port_name_t;
pub const __darwin_mode_t = __uint16_t;
pub const __darwin_off_t = __int64_t;
pub const __darwin_pid_t = __int32_t;
pub const __darwin_sigset_t = __uint32_t;
pub const __darwin_suseconds_t = __int32_t;
pub const __darwin_uid_t = __uint32_t;
pub const __darwin_useconds_t = __uint32_t;
pub const __darwin_uuid_t = [16]u8;
pub const __darwin_uuid_string_t = [37]u8;
pub const struct___darwin_pthread_handler_rec = extern struct {
    __routine: ?fn (?*c_void) callconv(.C) void,
    __arg: ?*c_void,
    __next: [*c]struct___darwin_pthread_handler_rec,
};
pub const struct__opaque_pthread_attr_t = extern struct {
    __sig: c_long,
    __opaque: [56]u8,
};
pub const struct__opaque_pthread_cond_t = extern struct {
    __sig: c_long,
    __opaque: [40]u8,
};
pub const struct__opaque_pthread_condattr_t = extern struct {
    __sig: c_long,
    __opaque: [8]u8,
};
pub const struct__opaque_pthread_mutex_t = extern struct {
    __sig: c_long,
    __opaque: [56]u8,
};
pub const struct__opaque_pthread_mutexattr_t = extern struct {
    __sig: c_long,
    __opaque: [8]u8,
};
pub const struct__opaque_pthread_once_t = extern struct {
    __sig: c_long,
    __opaque: [8]u8,
};
pub const struct__opaque_pthread_rwlock_t = extern struct {
    __sig: c_long,
    __opaque: [192]u8,
};
pub const struct__opaque_pthread_rwlockattr_t = extern struct {
    __sig: c_long,
    __opaque: [16]u8,
};
pub const struct__opaque_pthread_t = extern struct {
    __sig: c_long,
    __cleanup_stack: [*c]struct___darwin_pthread_handler_rec,
    __opaque: [8176]u8,
};
pub const __darwin_pthread_attr_t = struct__opaque_pthread_attr_t;
pub const __darwin_pthread_cond_t = struct__opaque_pthread_cond_t;
pub const __darwin_pthread_condattr_t = struct__opaque_pthread_condattr_t;
pub const __darwin_pthread_key_t = c_ulong;
pub const __darwin_pthread_mutex_t = struct__opaque_pthread_mutex_t;
pub const __darwin_pthread_mutexattr_t = struct__opaque_pthread_mutexattr_t;
pub const __darwin_pthread_once_t = struct__opaque_pthread_once_t;
pub const __darwin_pthread_rwlock_t = struct__opaque_pthread_rwlock_t;
pub const __darwin_pthread_rwlockattr_t = struct__opaque_pthread_rwlockattr_t;
pub const __darwin_pthread_t = [*c]struct__opaque_pthread_t;
pub const __darwin_nl_item = c_int;
pub const __darwin_wctrans_t = c_int;
pub const __darwin_wctype_t = __uint32_t;
pub const struct_sched_param = extern struct {
    sched_priority: c_int,
    __opaque: [4]u8,
};
pub extern fn sched_yield() c_int;
pub extern fn sched_get_priority_min(c_int) c_int;
pub extern fn sched_get_priority_max(c_int) c_int;
pub const u_int8_t = u8;
pub const u_int16_t = c_ushort;
pub const u_int32_t = c_uint;
pub const u_int64_t = c_ulonglong;
pub const register_t = i64;
pub const user_addr_t = u_int64_t;
pub const user_size_t = u_int64_t;
pub const user_ssize_t = i64;
pub const user_long_t = i64;
pub const user_ulong_t = u_int64_t;
pub const user_time_t = i64;
pub const user_off_t = i64;
pub const syscall_arg_t = u_int64_t;
pub const clock_t = __darwin_clock_t;
pub const time_t = __darwin_time_t;
pub const struct_timespec = extern struct {
    tv_sec: __darwin_time_t,
    tv_nsec: c_long,
};
pub const struct_tm = extern struct {
    tm_sec: c_int,
    tm_min: c_int,
    tm_hour: c_int,
    tm_mday: c_int,
    tm_mon: c_int,
    tm_year: c_int,
    tm_wday: c_int,
    tm_yday: c_int,
    tm_isdst: c_int,
    tm_gmtoff: c_long,
    tm_zone: [*c]u8,
};
pub extern var tzname: [*c][*c]u8;
pub extern var getdate_err: c_int;
pub extern var timezone: c_long;
pub extern var daylight: c_int;
pub extern fn asctime([*c]const struct_tm) [*c]u8;
pub extern fn clock() clock_t;
pub extern fn ctime([*c]const time_t) [*c]u8;
pub extern fn difftime(time_t, time_t) f64;
pub extern fn getdate([*c]const u8) [*c]struct_tm;
pub extern fn gmtime([*c]const time_t) [*c]struct_tm;
pub extern fn localtime([*c]const time_t) [*c]struct_tm;
pub extern fn mktime([*c]struct_tm) time_t;
pub extern fn strftime(noalias [*c]u8, usize, noalias [*c]const u8, noalias [*c]const struct_tm) usize;
pub extern fn strptime(noalias [*c]const u8, noalias [*c]const u8, noalias [*c]struct_tm) [*c]u8;
pub extern fn time([*c]time_t) time_t;
pub extern fn tzset() void;
pub extern fn asctime_r(noalias [*c]const struct_tm, noalias [*c]u8) [*c]u8;
pub extern fn ctime_r([*c]const time_t, [*c]u8) [*c]u8;
pub extern fn gmtime_r(noalias [*c]const time_t, noalias [*c]struct_tm) [*c]struct_tm;
pub extern fn localtime_r(noalias [*c]const time_t, noalias [*c]struct_tm) [*c]struct_tm;
pub extern fn posix2time(time_t) time_t;
pub extern fn tzsetwall() void;
pub extern fn time2posix(time_t) time_t;
pub extern fn timelocal([*c]struct_tm) time_t;
pub extern fn timegm([*c]struct_tm) time_t;
pub extern fn nanosleep(__rqtp: [*c]const struct_timespec, __rmtp: [*c]struct_timespec) c_int;
pub const _CLOCK_REALTIME = @enumToInt(enum_unnamed_2._CLOCK_REALTIME);
pub const _CLOCK_MONOTONIC = @enumToInt(enum_unnamed_2._CLOCK_MONOTONIC);
pub const _CLOCK_MONOTONIC_RAW = @enumToInt(enum_unnamed_2._CLOCK_MONOTONIC_RAW);
pub const _CLOCK_MONOTONIC_RAW_APPROX = @enumToInt(enum_unnamed_2._CLOCK_MONOTONIC_RAW_APPROX);
pub const _CLOCK_UPTIME_RAW = @enumToInt(enum_unnamed_2._CLOCK_UPTIME_RAW);
pub const _CLOCK_UPTIME_RAW_APPROX = @enumToInt(enum_unnamed_2._CLOCK_UPTIME_RAW_APPROX);
pub const _CLOCK_PROCESS_CPUTIME_ID = @enumToInt(enum_unnamed_2._CLOCK_PROCESS_CPUTIME_ID);
pub const _CLOCK_THREAD_CPUTIME_ID = @enumToInt(enum_unnamed_2._CLOCK_THREAD_CPUTIME_ID);
const enum_unnamed_2 = extern enum(c_int) {
    _CLOCK_REALTIME = 0,
    _CLOCK_MONOTONIC = 6,
    _CLOCK_MONOTONIC_RAW = 4,
    _CLOCK_MONOTONIC_RAW_APPROX = 5,
    _CLOCK_UPTIME_RAW = 8,
    _CLOCK_UPTIME_RAW_APPROX = 9,
    _CLOCK_PROCESS_CPUTIME_ID = 12,
    _CLOCK_THREAD_CPUTIME_ID = 16,
    _,
};
pub const clockid_t = enum_unnamed_2;
pub extern fn clock_getres(__clock_id: clockid_t, __res: [*c]struct_timespec) c_int;
pub extern fn clock_gettime(__clock_id: clockid_t, __tp: [*c]struct_timespec) c_int;
pub extern fn clock_gettime_nsec_np(__clock_id: clockid_t) __uint64_t;
pub extern fn clock_settime(__clock_id: clockid_t, __tp: [*c]const struct_timespec) c_int;
pub extern fn timespec_get(ts: [*c]struct_timespec, base: c_int) c_int;
pub const pthread_attr_t = __darwin_pthread_attr_t;
pub const pthread_cond_t = __darwin_pthread_cond_t;
pub const pthread_condattr_t = __darwin_pthread_condattr_t;
pub const pthread_key_t = __darwin_pthread_key_t;
pub const pthread_mutex_t = __darwin_pthread_mutex_t;
pub const pthread_mutexattr_t = __darwin_pthread_mutexattr_t;
pub const pthread_once_t = __darwin_pthread_once_t;
pub const pthread_rwlock_t = __darwin_pthread_rwlock_t;
pub const pthread_rwlockattr_t = __darwin_pthread_rwlockattr_t;
pub const pthread_t = __darwin_pthread_t;
pub const QOS_CLASS_USER_INTERACTIVE = @enumToInt(enum_unnamed_3.QOS_CLASS_USER_INTERACTIVE);
pub const QOS_CLASS_USER_INITIATED = @enumToInt(enum_unnamed_3.QOS_CLASS_USER_INITIATED);
pub const QOS_CLASS_DEFAULT = @enumToInt(enum_unnamed_3.QOS_CLASS_DEFAULT);
pub const QOS_CLASS_UTILITY = @enumToInt(enum_unnamed_3.QOS_CLASS_UTILITY);
pub const QOS_CLASS_BACKGROUND = @enumToInt(enum_unnamed_3.QOS_CLASS_BACKGROUND);
pub const QOS_CLASS_UNSPECIFIED = @enumToInt(enum_unnamed_3.QOS_CLASS_UNSPECIFIED);
const enum_unnamed_3 = extern enum(c_int) {
    QOS_CLASS_USER_INTERACTIVE = 33,
    QOS_CLASS_USER_INITIATED = 25,
    QOS_CLASS_DEFAULT = 21,
    QOS_CLASS_UTILITY = 17,
    QOS_CLASS_BACKGROUND = 9,
    QOS_CLASS_UNSPECIFIED = 0,
    _,
};
pub const qos_class_t = c_uint;
pub extern fn qos_class_self() qos_class_t;
pub extern fn qos_class_main() qos_class_t;
pub extern fn pthread_attr_set_qos_class_np(__attr: [*c]pthread_attr_t, __qos_class: qos_class_t, __relative_priority: c_int) c_int;
pub extern fn pthread_attr_get_qos_class_np(noalias __attr: [*c]pthread_attr_t, noalias __qos_class: [*c]qos_class_t, noalias __relative_priority: [*c]c_int) c_int;
pub extern fn pthread_set_qos_class_self_np(__qos_class: qos_class_t, __relative_priority: c_int) c_int;
pub extern fn pthread_get_qos_class_np(__pthread: pthread_t, noalias __qos_class: [*c]qos_class_t, noalias __relative_priority: [*c]c_int) c_int;
pub const struct_pthread_override_s = @Type(.Opaque);
pub const pthread_override_t = ?*struct_pthread_override_s;
pub extern fn pthread_override_qos_class_start_np(__pthread: pthread_t, __qos_class: qos_class_t, __relative_priority: c_int) pthread_override_t;
pub extern fn pthread_override_qos_class_end_np(__override: pthread_override_t) c_int;
pub const mach_port_t = __darwin_mach_port_t;
pub const sigset_t = __darwin_sigset_t;
pub extern fn pthread_atfork(?fn () callconv(.C) void, ?fn () callconv(.C) void, ?fn () callconv(.C) void) c_int;
pub extern fn pthread_attr_destroy([*c]pthread_attr_t) c_int;
pub extern fn pthread_attr_getdetachstate([*c]const pthread_attr_t, [*c]c_int) c_int;
pub extern fn pthread_attr_getguardsize(noalias [*c]const pthread_attr_t, noalias [*c]usize) c_int;
pub extern fn pthread_attr_getinheritsched(noalias [*c]const pthread_attr_t, noalias [*c]c_int) c_int;
pub extern fn pthread_attr_getschedparam(noalias [*c]const pthread_attr_t, noalias [*c]struct_sched_param) c_int;
pub extern fn pthread_attr_getschedpolicy(noalias [*c]const pthread_attr_t, noalias [*c]c_int) c_int;
pub extern fn pthread_attr_getscope(noalias [*c]const pthread_attr_t, noalias [*c]c_int) c_int;
pub extern fn pthread_attr_getstack(noalias [*c]const pthread_attr_t, noalias [*c]?*c_void, noalias [*c]usize) c_int;
pub extern fn pthread_attr_getstackaddr(noalias [*c]const pthread_attr_t, noalias [*c]?*c_void) c_int;
pub extern fn pthread_attr_getstacksize(noalias [*c]const pthread_attr_t, noalias [*c]usize) c_int;
pub extern fn pthread_attr_init([*c]pthread_attr_t) c_int;
pub extern fn pthread_attr_setdetachstate([*c]pthread_attr_t, c_int) c_int;
pub extern fn pthread_attr_setguardsize([*c]pthread_attr_t, usize) c_int;
pub extern fn pthread_attr_setinheritsched([*c]pthread_attr_t, c_int) c_int;
pub extern fn pthread_attr_setschedparam(noalias [*c]pthread_attr_t, noalias [*c]const struct_sched_param) c_int;
pub extern fn pthread_attr_setschedpolicy([*c]pthread_attr_t, c_int) c_int;
pub extern fn pthread_attr_setscope([*c]pthread_attr_t, c_int) c_int;
pub extern fn pthread_attr_setstack([*c]pthread_attr_t, ?*c_void, usize) c_int;
pub extern fn pthread_attr_setstackaddr([*c]pthread_attr_t, ?*c_void) c_int;
pub extern fn pthread_attr_setstacksize([*c]pthread_attr_t, usize) c_int;
pub extern fn pthread_cancel(pthread_t) c_int;
pub extern fn pthread_cond_broadcast([*c]pthread_cond_t) c_int;
pub extern fn pthread_cond_destroy([*c]pthread_cond_t) c_int;
pub extern fn pthread_cond_init(noalias [*c]pthread_cond_t, noalias [*c]const pthread_condattr_t) c_int;
pub extern fn pthread_cond_signal([*c]pthread_cond_t) c_int;
pub extern fn pthread_cond_timedwait(noalias [*c]pthread_cond_t, noalias [*c]pthread_mutex_t, noalias [*c]const struct_timespec) c_int;
pub extern fn pthread_cond_wait(noalias [*c]pthread_cond_t, noalias [*c]pthread_mutex_t) c_int;
pub extern fn pthread_condattr_destroy([*c]pthread_condattr_t) c_int;
pub extern fn pthread_condattr_init([*c]pthread_condattr_t) c_int;
pub extern fn pthread_condattr_getpshared(noalias [*c]const pthread_condattr_t, noalias [*c]c_int) c_int;
pub extern fn pthread_condattr_setpshared([*c]pthread_condattr_t, c_int) c_int;
pub extern fn pthread_create(noalias [*c]pthread_t, noalias [*c]const pthread_attr_t, ?fn (?*c_void) callconv(.C) ?*c_void, noalias ?*c_void) c_int;
pub extern fn pthread_detach(pthread_t) c_int;
pub extern fn pthread_equal(pthread_t, pthread_t) c_int;
pub extern fn pthread_exit(?*c_void) noreturn;
pub extern fn pthread_getconcurrency() c_int;
pub extern fn pthread_getschedparam(pthread_t, noalias [*c]c_int, noalias [*c]struct_sched_param) c_int;
pub extern fn pthread_getspecific(pthread_key_t) ?*c_void;
pub extern fn pthread_join(pthread_t, [*c]?*c_void) c_int;
pub extern fn pthread_key_create([*c]pthread_key_t, ?fn (?*c_void) callconv(.C) void) c_int;
pub extern fn pthread_key_delete(pthread_key_t) c_int;
pub extern fn pthread_mutex_destroy([*c]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_getprioceiling(noalias [*c]const pthread_mutex_t, noalias [*c]c_int) c_int;
pub extern fn pthread_mutex_init(noalias [*c]pthread_mutex_t, noalias [*c]const pthread_mutexattr_t) c_int;
pub extern fn pthread_mutex_lock([*c]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_setprioceiling(noalias [*c]pthread_mutex_t, c_int, noalias [*c]c_int) c_int;
pub extern fn pthread_mutex_trylock([*c]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_unlock([*c]pthread_mutex_t) c_int;
pub extern fn pthread_mutexattr_destroy([*c]pthread_mutexattr_t) c_int;
pub extern fn pthread_mutexattr_getprioceiling(noalias [*c]const pthread_mutexattr_t, noalias [*c]c_int) c_int;
pub extern fn pthread_mutexattr_getprotocol(noalias [*c]const pthread_mutexattr_t, noalias [*c]c_int) c_int;
pub extern fn pthread_mutexattr_getpshared(noalias [*c]const pthread_mutexattr_t, noalias [*c]c_int) c_int;
pub extern fn pthread_mutexattr_gettype(noalias [*c]const pthread_mutexattr_t, noalias [*c]c_int) c_int;
pub extern fn pthread_mutexattr_getpolicy_np(noalias [*c]const pthread_mutexattr_t, noalias [*c]c_int) c_int;
pub extern fn pthread_mutexattr_init([*c]pthread_mutexattr_t) c_int;
pub extern fn pthread_mutexattr_setprioceiling([*c]pthread_mutexattr_t, c_int) c_int;
pub extern fn pthread_mutexattr_setprotocol([*c]pthread_mutexattr_t, c_int) c_int;
pub extern fn pthread_mutexattr_setpshared([*c]pthread_mutexattr_t, c_int) c_int;
pub extern fn pthread_mutexattr_settype([*c]pthread_mutexattr_t, c_int) c_int;
pub extern fn pthread_mutexattr_setpolicy_np([*c]pthread_mutexattr_t, c_int) c_int;
pub extern fn pthread_once([*c]pthread_once_t, ?fn () callconv(.C) void) c_int;
pub extern fn pthread_rwlock_destroy([*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_init(noalias [*c]pthread_rwlock_t, noalias [*c]const pthread_rwlockattr_t) c_int;
pub extern fn pthread_rwlock_rdlock([*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_tryrdlock([*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_trywrlock([*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_wrlock([*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_unlock([*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlockattr_destroy([*c]pthread_rwlockattr_t) c_int;
pub extern fn pthread_rwlockattr_getpshared(noalias [*c]const pthread_rwlockattr_t, noalias [*c]c_int) c_int;
pub extern fn pthread_rwlockattr_init([*c]pthread_rwlockattr_t) c_int;
pub extern fn pthread_rwlockattr_setpshared([*c]pthread_rwlockattr_t, c_int) c_int;
pub extern fn pthread_self() pthread_t;
pub extern fn pthread_setcancelstate(c_int, [*c]c_int) c_int;
pub extern fn pthread_setcanceltype(c_int, [*c]c_int) c_int;
pub extern fn pthread_setconcurrency(c_int) c_int;
pub extern fn pthread_setschedparam(pthread_t, c_int, [*c]const struct_sched_param) c_int;
pub extern fn pthread_setspecific(pthread_key_t, ?*const c_void) c_int;
pub extern fn pthread_testcancel() void;
pub extern fn pthread_is_threaded_np() c_int;
pub extern fn pthread_threadid_np(pthread_t, [*c]__uint64_t) c_int;
pub extern fn pthread_getname_np(pthread_t, [*c]u8, usize) c_int;
pub extern fn pthread_setname_np([*c]const u8) c_int;
pub extern fn pthread_main_np() c_int;
pub extern fn pthread_mach_thread_np(pthread_t) mach_port_t;
pub extern fn pthread_get_stacksize_np(pthread_t) usize;
pub extern fn pthread_get_stackaddr_np(pthread_t) ?*c_void;
pub extern fn pthread_cond_signal_thread_np([*c]pthread_cond_t, pthread_t) c_int;
pub extern fn pthread_cond_timedwait_relative_np([*c]pthread_cond_t, [*c]pthread_mutex_t, [*c]const struct_timespec) c_int;
pub extern fn pthread_create_suspended_np([*c]pthread_t, [*c]const pthread_attr_t, ?fn (?*c_void) callconv(.C) ?*c_void, ?*c_void) c_int;
pub extern fn pthread_kill(pthread_t, c_int) c_int;
pub extern fn pthread_from_mach_thread_np(mach_port_t) pthread_t;
pub extern fn pthread_sigmask(c_int, [*c]const sigset_t, [*c]sigset_t) c_int;
pub extern fn pthread_yield_np() void;
pub const ptrdiff_t = c_long;
pub const rsize_t = c_ulong;
pub const wchar_t = c_int;
pub const max_align_t = c_longdouble;
pub const ma_int8 = i8;
pub const ma_uint8 = u8;
pub const ma_int16 = c_short;
pub const ma_uint16 = c_ushort;
pub const ma_int32 = c_int;
pub const ma_uint32 = c_uint;
pub const ma_int64 = c_longlong;
pub const ma_uint64 = c_ulonglong;
pub const ma_uintptr = ma_uint64;
pub const ma_bool8 = ma_uint8;
pub const ma_bool32 = ma_uint32;
pub const ma_handle = ?*c_void;
pub const ma_ptr = ?*c_void;
pub const ma_proc = ?fn () callconv(.C) void;
const struct_unnamed_5 = extern struct {
    hCoreFoundation: ma_handle,
    CFStringGetCString: ma_proc,
    CFRelease: ma_proc,
    hCoreAudio: ma_handle,
    AudioObjectGetPropertyData: ma_proc,
    AudioObjectGetPropertyDataSize: ma_proc,
    AudioObjectSetPropertyData: ma_proc,
    AudioObjectAddPropertyListener: ma_proc,
    AudioObjectRemovePropertyListener: ma_proc,
    hAudioUnit: ma_handle,
    AudioComponentFindNext: ma_proc,
    AudioComponentInstanceDispose: ma_proc,
    AudioComponentInstanceNew: ma_proc,
    AudioOutputUnitStart: ma_proc,
    AudioOutputUnitStop: ma_proc,
    AudioUnitAddPropertyListener: ma_proc,
    AudioUnitGetPropertyInfo: ma_proc,
    AudioUnitGetProperty: ma_proc,
    AudioUnitSetProperty: ma_proc,
    AudioUnitInitialize: ma_proc,
    AudioUnitRender: ma_proc,
    component: ma_ptr,
    noAudioSessionDeactivate: ma_bool32,
};
const struct_unnamed_6 = extern struct {
    _unused: c_int,
};
const union_unnamed_4 = extern union {
    coreaudio: struct_unnamed_5,
    null_backend: struct_unnamed_6,
};
const struct_unnamed_8 = extern struct {
    pthreadSO: ma_handle,
    pthread_create: ma_proc,
    pthread_join: ma_proc,
    pthread_mutex_init: ma_proc,
    pthread_mutex_destroy: ma_proc,
    pthread_mutex_lock: ma_proc,
    pthread_mutex_unlock: ma_proc,
    pthread_cond_init: ma_proc,
    pthread_cond_destroy: ma_proc,
    pthread_cond_wait: ma_proc,
    pthread_cond_signal: ma_proc,
    pthread_attr_init: ma_proc,
    pthread_attr_destroy: ma_proc,
    pthread_attr_setschedpolicy: ma_proc,
    pthread_attr_getschedparam: ma_proc,
    pthread_attr_setschedparam: ma_proc,
};
const union_unnamed_7 = extern union {
    posix: struct_unnamed_8,
    _unused: c_int,
};
pub const struct_ma_context = extern struct {
    backend: ma_backend,
    logCallback: ma_log_proc,
    threadPriority: ma_thread_priority,
    threadStackSize: usize,
    pUserData: ?*c_void,
    allocationCallbacks: ma_allocation_callbacks,
    deviceEnumLock: ma_mutex,
    deviceInfoLock: ma_mutex,
    deviceInfoCapacity: ma_uint32,
    playbackDeviceInfoCount: ma_uint32,
    captureDeviceInfoCount: ma_uint32,
    pDeviceInfos: [*c]ma_device_info,
    isBackendAsynchronous: ma_bool32,
    onUninit: ?fn ([*c]ma_context) callconv(.C) ma_result,
    onDeviceIDEqual: ?fn ([*c]ma_context, [*c]const ma_device_id, [*c]const ma_device_id) callconv(.C) ma_bool32,
    onEnumDevices: ?fn ([*c]ma_context, ma_enum_devices_callback_proc, ?*c_void) callconv(.C) ma_result,
    onGetDeviceInfo: ?fn ([*c]ma_context, ma_device_type, [*c]const ma_device_id, ma_share_mode, [*c]ma_device_info) callconv(.C) ma_result,
    onDeviceInit: ?fn ([*c]ma_context, [*c]const ma_device_config, [*c]ma_device) callconv(.C) ma_result,
    onDeviceUninit: ?fn ([*c]ma_device) callconv(.C) void,
    onDeviceStart: ?fn ([*c]ma_device) callconv(.C) ma_result,
    onDeviceStop: ?fn ([*c]ma_device) callconv(.C) ma_result,
    onDeviceMainLoop: ?fn ([*c]ma_device) callconv(.C) ma_result,
    unnamed_0: union_unnamed_4,
    unnamed_1: union_unnamed_7,
};
pub const ma_context = struct_ma_context;
const struct_unnamed_10 = extern struct {
    lpfOrder: ma_uint32,
};
const struct_unnamed_11 = extern struct {
    quality: c_int,
};
const struct_unnamed_9 = extern struct {
    algorithm: ma_resample_algorithm,
    linear: struct_unnamed_10,
    speex: struct_unnamed_11,
};
const struct_unnamed_12 = extern struct {
    id: ma_device_id,
    name: [256]u8,
    shareMode: ma_share_mode,
    usingDefaultFormat: ma_bool32,
    usingDefaultChannels: ma_bool32,
    usingDefaultChannelMap: ma_bool32,
    format: ma_format,
    channels: ma_uint32,
    channelMap: [32]ma_channel,
    internalFormat: ma_format,
    internalChannels: ma_uint32,
    internalSampleRate: ma_uint32,
    internalChannelMap: [32]ma_channel,
    internalPeriodSizeInFrames: ma_uint32,
    internalPeriods: ma_uint32,
    converter: ma_data_converter,
};
const struct_unnamed_13 = extern struct {
    id: ma_device_id,
    name: [256]u8,
    shareMode: ma_share_mode,
    usingDefaultFormat: ma_bool32,
    usingDefaultChannels: ma_bool32,
    usingDefaultChannelMap: ma_bool32,
    format: ma_format,
    channels: ma_uint32,
    channelMap: [32]ma_channel,
    internalFormat: ma_format,
    internalChannels: ma_uint32,
    internalSampleRate: ma_uint32,
    internalChannelMap: [32]ma_channel,
    internalPeriodSizeInFrames: ma_uint32,
    internalPeriods: ma_uint32,
    converter: ma_data_converter,
};
const struct_unnamed_15 = extern struct {
    deviceObjectIDPlayback: ma_uint32,
    deviceObjectIDCapture: ma_uint32,
    audioUnitPlayback: ma_ptr,
    audioUnitCapture: ma_ptr,
    pAudioBufferList: ma_ptr,
    stopEvent: ma_event,
    originalPeriodSizeInFrames: ma_uint32,
    originalPeriodSizeInMilliseconds: ma_uint32,
    originalPeriods: ma_uint32,
    isDefaultPlaybackDevice: ma_bool32,
    isDefaultCaptureDevice: ma_bool32,
    isSwitchingPlaybackDevice: ma_bool32,
    isSwitchingCaptureDevice: ma_bool32,
    duplexRB: ma_pcm_rb,
    pRouteChangeHandler: ?*c_void,
};
const struct_unnamed_16 = extern struct {
    deviceThread: ma_thread,
    operationEvent: ma_event,
    operationCompletionEvent: ma_event,
    operation: ma_uint32,
    operationResult: ma_result,
    timer: ma_timer,
    priorRunTime: f64,
    currentPeriodFramesRemainingPlayback: ma_uint32,
    currentPeriodFramesRemainingCapture: ma_uint32,
    lastProcessedFramePlayback: ma_uint64,
    lastProcessedFrameCapture: ma_uint32,
    isStarted: ma_bool32,
};
const union_unnamed_14 = extern union {
    coreaudio: struct_unnamed_15,
    null_device: struct_unnamed_16,
};
pub const struct_ma_device = extern struct {
    pContext: [*c]ma_context,
    type: ma_device_type,
    sampleRate: ma_uint32,
    state: ma_uint32,
    onData: ma_device_callback_proc,
    onStop: ma_stop_proc,
    pUserData: ?*c_void,
    lock: ma_mutex,
    wakeupEvent: ma_event,
    startEvent: ma_event,
    stopEvent: ma_event,
    thread: ma_thread,
    workResult: ma_result,
    usingDefaultSampleRate: ma_bool32,
    usingDefaultBufferSize: ma_bool32,
    usingDefaultPeriods: ma_bool32,
    isOwnerOfContext: ma_bool32,
    noPreZeroedOutputBuffer: ma_bool32,
    noClip: ma_bool32,
    masterVolumeFactor: f32,
    resampling: struct_unnamed_9,
    playback: struct_unnamed_12,
    capture: struct_unnamed_13,
    unnamed_0: union_unnamed_14,
};
pub const ma_device = struct_ma_device;
pub const ma_channel = ma_uint8;
pub const ma_result = c_int;
pub const ma_stream_format_pcm = @enumToInt(enum_unnamed_17.ma_stream_format_pcm);
const enum_unnamed_17 = extern enum(c_int) {
    ma_stream_format_pcm = 0,
    _,
};
pub const ma_stream_format = enum_unnamed_17;
pub const ma_stream_layout_interleaved = @enumToInt(enum_unnamed_18.ma_stream_layout_interleaved);
pub const ma_stream_layout_deinterleaved = @enumToInt(enum_unnamed_18.ma_stream_layout_deinterleaved);
const enum_unnamed_18 = extern enum(c_int) {
    ma_stream_layout_interleaved = 0,
    ma_stream_layout_deinterleaved = 1,
    _,
};
pub const ma_stream_layout = enum_unnamed_18;
pub const ma_dither_mode_none = @enumToInt(enum_unnamed_19.ma_dither_mode_none);
pub const ma_dither_mode_rectangle = @enumToInt(enum_unnamed_19.ma_dither_mode_rectangle);
pub const ma_dither_mode_triangle = @enumToInt(enum_unnamed_19.ma_dither_mode_triangle);
const enum_unnamed_19 = extern enum(c_int) {
    ma_dither_mode_none = 0,
    ma_dither_mode_rectangle = 1,
    ma_dither_mode_triangle = 2,
    _,
};
pub const ma_dither_mode = enum_unnamed_19;
pub const ma_format_unknown = @enumToInt(enum_unnamed_20.ma_format_unknown);
pub const ma_format_u8 = @enumToInt(enum_unnamed_20.ma_format_u8);
pub const ma_format_s16 = @enumToInt(enum_unnamed_20.ma_format_s16);
pub const ma_format_s24 = @enumToInt(enum_unnamed_20.ma_format_s24);
pub const ma_format_s32 = @enumToInt(enum_unnamed_20.ma_format_s32);
pub const ma_format_f32 = @enumToInt(enum_unnamed_20.ma_format_f32);
pub const ma_format_count = @enumToInt(enum_unnamed_20.ma_format_count);
const enum_unnamed_20 = extern enum(c_int) {
    ma_format_unknown = 0,
    ma_format_u8 = 1,
    ma_format_s16 = 2,
    ma_format_s24 = 3,
    ma_format_s32 = 4,
    ma_format_f32 = 5,
    ma_format_count = 6,
    _,
};
pub const ma_format = enum_unnamed_20;
pub const ma_channel_mix_mode_rectangular = @enumToInt(enum_unnamed_21.ma_channel_mix_mode_rectangular);
pub const ma_channel_mix_mode_simple = @enumToInt(enum_unnamed_21.ma_channel_mix_mode_simple);
pub const ma_channel_mix_mode_custom_weights = @enumToInt(enum_unnamed_21.ma_channel_mix_mode_custom_weights);
pub const ma_channel_mix_mode_planar_blend = @enumToInt(enum_unnamed_21.ma_channel_mix_mode_planar_blend);
pub const ma_channel_mix_mode_default = @enumToInt(enum_unnamed_21.ma_channel_mix_mode_default);
const enum_unnamed_21 = extern enum(c_int) {
    ma_channel_mix_mode_rectangular = 0,
    ma_channel_mix_mode_simple = 1,
    ma_channel_mix_mode_custom_weights = 2,
    ma_channel_mix_mode_planar_blend = 0,
    ma_channel_mix_mode_default = 0,
    _,
};
pub const ma_channel_mix_mode = enum_unnamed_21;
pub const ma_standard_channel_map_microsoft = @enumToInt(enum_unnamed_22.ma_standard_channel_map_microsoft);
pub const ma_standard_channel_map_alsa = @enumToInt(enum_unnamed_22.ma_standard_channel_map_alsa);
pub const ma_standard_channel_map_rfc3551 = @enumToInt(enum_unnamed_22.ma_standard_channel_map_rfc3551);
pub const ma_standard_channel_map_flac = @enumToInt(enum_unnamed_22.ma_standard_channel_map_flac);
pub const ma_standard_channel_map_vorbis = @enumToInt(enum_unnamed_22.ma_standard_channel_map_vorbis);
pub const ma_standard_channel_map_sound4 = @enumToInt(enum_unnamed_22.ma_standard_channel_map_sound4);
pub const ma_standard_channel_map_sndio = @enumToInt(enum_unnamed_22.ma_standard_channel_map_sndio);
pub const ma_standard_channel_map_webaudio = @enumToInt(enum_unnamed_22.ma_standard_channel_map_webaudio);
pub const ma_standard_channel_map_default = @enumToInt(enum_unnamed_22.ma_standard_channel_map_default);
const enum_unnamed_22 = extern enum(c_int) {
    ma_standard_channel_map_microsoft = 0,
    ma_standard_channel_map_alsa = 1,
    ma_standard_channel_map_rfc3551 = 2,
    ma_standard_channel_map_flac = 3,
    ma_standard_channel_map_vorbis = 4,
    ma_standard_channel_map_sound4 = 5,
    ma_standard_channel_map_sndio = 6,
    ma_standard_channel_map_webaudio = 3,
    ma_standard_channel_map_default = 0,
    _,
};
pub const ma_standard_channel_map = enum_unnamed_22;
pub const ma_performance_profile_low_latency = @enumToInt(enum_unnamed_23.ma_performance_profile_low_latency);
pub const ma_performance_profile_conservative = @enumToInt(enum_unnamed_23.ma_performance_profile_conservative);
const enum_unnamed_23 = extern enum(c_int) {
    ma_performance_profile_low_latency = 0,
    ma_performance_profile_conservative = 1,
    _,
};
pub const ma_performance_profile = enum_unnamed_23;
const struct_unnamed_24 = extern struct {
    pUserData: ?*c_void,
    onMalloc: ?fn (usize, ?*c_void) callconv(.C) ?*c_void,
    onRealloc: ?fn (?*c_void, usize, ?*c_void) callconv(.C) ?*c_void,
    onFree: ?fn (?*c_void, ?*c_void) callconv(.C) void,
};
pub const ma_allocation_callbacks = struct_unnamed_24;
const struct_unnamed_25 = extern struct {
    state: ma_int32,
};
pub const ma_lcg = struct_unnamed_25;
pub const ma_thread_priority_idle = @enumToInt(enum_unnamed_26.ma_thread_priority_idle);
pub const ma_thread_priority_lowest = @enumToInt(enum_unnamed_26.ma_thread_priority_lowest);
pub const ma_thread_priority_low = @enumToInt(enum_unnamed_26.ma_thread_priority_low);
pub const ma_thread_priority_normal = @enumToInt(enum_unnamed_26.ma_thread_priority_normal);
pub const ma_thread_priority_high = @enumToInt(enum_unnamed_26.ma_thread_priority_high);
pub const ma_thread_priority_highest = @enumToInt(enum_unnamed_26.ma_thread_priority_highest);
pub const ma_thread_priority_realtime = @enumToInt(enum_unnamed_26.ma_thread_priority_realtime);
pub const ma_thread_priority_default = @enumToInt(enum_unnamed_26.ma_thread_priority_default);
const enum_unnamed_26 = extern enum(c_int) {
    ma_thread_priority_idle = -5,
    ma_thread_priority_lowest = -4,
    ma_thread_priority_low = -3,
    ma_thread_priority_normal = -2,
    ma_thread_priority_high = -1,
    ma_thread_priority_highest = 0,
    ma_thread_priority_realtime = 1,
    ma_thread_priority_default = 0,
    _,
};
pub const ma_thread_priority = enum_unnamed_26;
pub const ma_spinlock = u8;
pub const ma_thread = pthread_t;
pub const ma_mutex = pthread_mutex_t;
const struct_unnamed_27 = extern struct {
    value: ma_uint32,
    lock: pthread_mutex_t,
    cond: pthread_cond_t,
};
pub const ma_event = struct_unnamed_27;
const struct_unnamed_28 = extern struct {
    value: c_int,
    lock: pthread_mutex_t,
    cond: pthread_cond_t,
};
pub const ma_semaphore = struct_unnamed_28;
pub extern fn ma_version(pMajor: [*c]ma_uint32, pMinor: [*c]ma_uint32, pRevision: [*c]ma_uint32) void;
pub extern fn ma_version_string() [*c]const u8;
const union_unnamed_29 = extern union {
    f32: f32,
    s32: ma_int32,
};
pub const ma_biquad_coefficient = union_unnamed_29;
const struct_unnamed_30 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    b0: f64,
    b1: f64,
    b2: f64,
    a0: f64,
    a1: f64,
    a2: f64,
};
pub const ma_biquad_config = struct_unnamed_30;
pub extern fn ma_biquad_config_init(format: ma_format, channels: ma_uint32, b0: f64, b1: f64, b2: f64, a0: f64, a1: f64, a2: f64) ma_biquad_config;
const struct_unnamed_31 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    b0: ma_biquad_coefficient,
    b1: ma_biquad_coefficient,
    b2: ma_biquad_coefficient,
    a1: ma_biquad_coefficient,
    a2: ma_biquad_coefficient,
    r1: [32]ma_biquad_coefficient,
    r2: [32]ma_biquad_coefficient,
};
pub const ma_biquad = struct_unnamed_31;
pub extern fn ma_biquad_init(pConfig: [*c]const ma_biquad_config, pBQ: [*c]ma_biquad) ma_result;
pub extern fn ma_biquad_reinit(pConfig: [*c]const ma_biquad_config, pBQ: [*c]ma_biquad) ma_result;
pub extern fn ma_biquad_process_pcm_frames(pBQ: [*c]ma_biquad, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_biquad_get_latency(pBQ: [*c]ma_biquad) ma_uint32;
const struct_unnamed_32 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    cutoffFrequency: f64,
    q: f64,
};
pub const ma_lpf1_config = struct_unnamed_32;
pub const ma_lpf2_config = struct_unnamed_32;
pub extern fn ma_lpf1_config_init(format: ma_format, channels: ma_uint32, sampleRate: ma_uint32, cutoffFrequency: f64) ma_lpf1_config;
pub extern fn ma_lpf2_config_init(format: ma_format, channels: ma_uint32, sampleRate: ma_uint32, cutoffFrequency: f64, q: f64) ma_lpf2_config;
const struct_unnamed_33 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    a: ma_biquad_coefficient,
    r1: [32]ma_biquad_coefficient,
};
pub const ma_lpf1 = struct_unnamed_33;
pub extern fn ma_lpf1_init(pConfig: [*c]const ma_lpf1_config, pLPF: [*c]ma_lpf1) ma_result;
pub extern fn ma_lpf1_reinit(pConfig: [*c]const ma_lpf1_config, pLPF: [*c]ma_lpf1) ma_result;
pub extern fn ma_lpf1_process_pcm_frames(pLPF: [*c]ma_lpf1, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_lpf1_get_latency(pLPF: [*c]ma_lpf1) ma_uint32;
const struct_unnamed_34 = extern struct {
    bq: ma_biquad,
};
pub const ma_lpf2 = struct_unnamed_34;
pub extern fn ma_lpf2_init(pConfig: [*c]const ma_lpf2_config, pLPF: [*c]ma_lpf2) ma_result;
pub extern fn ma_lpf2_reinit(pConfig: [*c]const ma_lpf2_config, pLPF: [*c]ma_lpf2) ma_result;
pub extern fn ma_lpf2_process_pcm_frames(pLPF: [*c]ma_lpf2, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_lpf2_get_latency(pLPF: [*c]ma_lpf2) ma_uint32;
const struct_unnamed_35 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    cutoffFrequency: f64,
    order: ma_uint32,
};
pub const ma_lpf_config = struct_unnamed_35;
pub extern fn ma_lpf_config_init(format: ma_format, channels: ma_uint32, sampleRate: ma_uint32, cutoffFrequency: f64, order: ma_uint32) ma_lpf_config;
const struct_unnamed_36 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    lpf1Count: ma_uint32,
    lpf2Count: ma_uint32,
    lpf1: [1]ma_lpf1,
    lpf2: [4]ma_lpf2,
};
pub const ma_lpf = struct_unnamed_36;
pub extern fn ma_lpf_init(pConfig: [*c]const ma_lpf_config, pLPF: [*c]ma_lpf) ma_result;
pub extern fn ma_lpf_reinit(pConfig: [*c]const ma_lpf_config, pLPF: [*c]ma_lpf) ma_result;
pub extern fn ma_lpf_process_pcm_frames(pLPF: [*c]ma_lpf, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_lpf_get_latency(pLPF: [*c]ma_lpf) ma_uint32;
const struct_unnamed_37 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    cutoffFrequency: f64,
    q: f64,
};
pub const ma_hpf1_config = struct_unnamed_37;
pub const ma_hpf2_config = struct_unnamed_37;
pub extern fn ma_hpf1_config_init(format: ma_format, channels: ma_uint32, sampleRate: ma_uint32, cutoffFrequency: f64) ma_hpf1_config;
pub extern fn ma_hpf2_config_init(format: ma_format, channels: ma_uint32, sampleRate: ma_uint32, cutoffFrequency: f64, q: f64) ma_hpf2_config;
const struct_unnamed_38 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    a: ma_biquad_coefficient,
    r1: [32]ma_biquad_coefficient,
};
pub const ma_hpf1 = struct_unnamed_38;
pub extern fn ma_hpf1_init(pConfig: [*c]const ma_hpf1_config, pHPF: [*c]ma_hpf1) ma_result;
pub extern fn ma_hpf1_reinit(pConfig: [*c]const ma_hpf1_config, pHPF: [*c]ma_hpf1) ma_result;
pub extern fn ma_hpf1_process_pcm_frames(pHPF: [*c]ma_hpf1, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_hpf1_get_latency(pHPF: [*c]ma_hpf1) ma_uint32;
const struct_unnamed_39 = extern struct {
    bq: ma_biquad,
};
pub const ma_hpf2 = struct_unnamed_39;
pub extern fn ma_hpf2_init(pConfig: [*c]const ma_hpf2_config, pHPF: [*c]ma_hpf2) ma_result;
pub extern fn ma_hpf2_reinit(pConfig: [*c]const ma_hpf2_config, pHPF: [*c]ma_hpf2) ma_result;
pub extern fn ma_hpf2_process_pcm_frames(pHPF: [*c]ma_hpf2, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_hpf2_get_latency(pHPF: [*c]ma_hpf2) ma_uint32;
const struct_unnamed_40 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    cutoffFrequency: f64,
    order: ma_uint32,
};
pub const ma_hpf_config = struct_unnamed_40;
pub extern fn ma_hpf_config_init(format: ma_format, channels: ma_uint32, sampleRate: ma_uint32, cutoffFrequency: f64, order: ma_uint32) ma_hpf_config;
const struct_unnamed_41 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    hpf1Count: ma_uint32,
    hpf2Count: ma_uint32,
    hpf1: [1]ma_hpf1,
    hpf2: [4]ma_hpf2,
};
pub const ma_hpf = struct_unnamed_41;
pub extern fn ma_hpf_init(pConfig: [*c]const ma_hpf_config, pHPF: [*c]ma_hpf) ma_result;
pub extern fn ma_hpf_reinit(pConfig: [*c]const ma_hpf_config, pHPF: [*c]ma_hpf) ma_result;
pub extern fn ma_hpf_process_pcm_frames(pHPF: [*c]ma_hpf, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_hpf_get_latency(pHPF: [*c]ma_hpf) ma_uint32;
const struct_unnamed_42 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    cutoffFrequency: f64,
    q: f64,
};
pub const ma_bpf2_config = struct_unnamed_42;
pub extern fn ma_bpf2_config_init(format: ma_format, channels: ma_uint32, sampleRate: ma_uint32, cutoffFrequency: f64, q: f64) ma_bpf2_config;
const struct_unnamed_43 = extern struct {
    bq: ma_biquad,
};
pub const ma_bpf2 = struct_unnamed_43;
pub extern fn ma_bpf2_init(pConfig: [*c]const ma_bpf2_config, pBPF: [*c]ma_bpf2) ma_result;
pub extern fn ma_bpf2_reinit(pConfig: [*c]const ma_bpf2_config, pBPF: [*c]ma_bpf2) ma_result;
pub extern fn ma_bpf2_process_pcm_frames(pBPF: [*c]ma_bpf2, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_bpf2_get_latency(pBPF: [*c]ma_bpf2) ma_uint32;
const struct_unnamed_44 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    cutoffFrequency: f64,
    order: ma_uint32,
};
pub const ma_bpf_config = struct_unnamed_44;
pub extern fn ma_bpf_config_init(format: ma_format, channels: ma_uint32, sampleRate: ma_uint32, cutoffFrequency: f64, order: ma_uint32) ma_bpf_config;
const struct_unnamed_45 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    bpf2Count: ma_uint32,
    bpf2: [4]ma_bpf2,
};
pub const ma_bpf = struct_unnamed_45;
pub extern fn ma_bpf_init(pConfig: [*c]const ma_bpf_config, pBPF: [*c]ma_bpf) ma_result;
pub extern fn ma_bpf_reinit(pConfig: [*c]const ma_bpf_config, pBPF: [*c]ma_bpf) ma_result;
pub extern fn ma_bpf_process_pcm_frames(pBPF: [*c]ma_bpf, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_bpf_get_latency(pBPF: [*c]ma_bpf) ma_uint32;
const struct_unnamed_46 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    q: f64,
    frequency: f64,
};
pub const ma_notch2_config = struct_unnamed_46;
pub extern fn ma_notch2_config_init(format: ma_format, channels: ma_uint32, sampleRate: ma_uint32, q: f64, frequency: f64) ma_notch2_config;
const struct_unnamed_47 = extern struct {
    bq: ma_biquad,
};
pub const ma_notch2 = struct_unnamed_47;
pub extern fn ma_notch2_init(pConfig: [*c]const ma_notch2_config, pFilter: [*c]ma_notch2) ma_result;
pub extern fn ma_notch2_reinit(pConfig: [*c]const ma_notch2_config, pFilter: [*c]ma_notch2) ma_result;
pub extern fn ma_notch2_process_pcm_frames(pFilter: [*c]ma_notch2, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_notch2_get_latency(pFilter: [*c]ma_notch2) ma_uint32;
const struct_unnamed_48 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    gainDB: f64,
    q: f64,
    frequency: f64,
};
pub const ma_peak2_config = struct_unnamed_48;
pub extern fn ma_peak2_config_init(format: ma_format, channels: ma_uint32, sampleRate: ma_uint32, gainDB: f64, q: f64, frequency: f64) ma_peak2_config;
const struct_unnamed_49 = extern struct {
    bq: ma_biquad,
};
pub const ma_peak2 = struct_unnamed_49;
pub extern fn ma_peak2_init(pConfig: [*c]const ma_peak2_config, pFilter: [*c]ma_peak2) ma_result;
pub extern fn ma_peak2_reinit(pConfig: [*c]const ma_peak2_config, pFilter: [*c]ma_peak2) ma_result;
pub extern fn ma_peak2_process_pcm_frames(pFilter: [*c]ma_peak2, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_peak2_get_latency(pFilter: [*c]ma_peak2) ma_uint32;
const struct_unnamed_50 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    gainDB: f64,
    shelfSlope: f64,
    frequency: f64,
};
pub const ma_loshelf2_config = struct_unnamed_50;
pub extern fn ma_loshelf2_config_init(format: ma_format, channels: ma_uint32, sampleRate: ma_uint32, gainDB: f64, shelfSlope: f64, frequency: f64) ma_loshelf2_config;
const struct_unnamed_51 = extern struct {
    bq: ma_biquad,
};
pub const ma_loshelf2 = struct_unnamed_51;
pub extern fn ma_loshelf2_init(pConfig: [*c]const ma_loshelf2_config, pFilter: [*c]ma_loshelf2) ma_result;
pub extern fn ma_loshelf2_reinit(pConfig: [*c]const ma_loshelf2_config, pFilter: [*c]ma_loshelf2) ma_result;
pub extern fn ma_loshelf2_process_pcm_frames(pFilter: [*c]ma_loshelf2, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_loshelf2_get_latency(pFilter: [*c]ma_loshelf2) ma_uint32;
const struct_unnamed_52 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    gainDB: f64,
    shelfSlope: f64,
    frequency: f64,
};
pub const ma_hishelf2_config = struct_unnamed_52;
pub extern fn ma_hishelf2_config_init(format: ma_format, channels: ma_uint32, sampleRate: ma_uint32, gainDB: f64, shelfSlope: f64, frequency: f64) ma_hishelf2_config;
const struct_unnamed_53 = extern struct {
    bq: ma_biquad,
};
pub const ma_hishelf2 = struct_unnamed_53;
pub extern fn ma_hishelf2_init(pConfig: [*c]const ma_hishelf2_config, pFilter: [*c]ma_hishelf2) ma_result;
pub extern fn ma_hishelf2_reinit(pConfig: [*c]const ma_hishelf2_config, pFilter: [*c]ma_hishelf2) ma_result;
pub extern fn ma_hishelf2_process_pcm_frames(pFilter: [*c]ma_hishelf2, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_hishelf2_get_latency(pFilter: [*c]ma_hishelf2) ma_uint32;
const struct_unnamed_54 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRateIn: ma_uint32,
    sampleRateOut: ma_uint32,
    lpfOrder: ma_uint32,
    lpfNyquistFactor: f64,
};
pub const ma_linear_resampler_config = struct_unnamed_54;
pub extern fn ma_linear_resampler_config_init(format: ma_format, channels: ma_uint32, sampleRateIn: ma_uint32, sampleRateOut: ma_uint32) ma_linear_resampler_config;
const union_unnamed_56 = extern union {
    f32: [32]f32,
    s16: [32]ma_int16,
};
const union_unnamed_57 = extern union {
    f32: [32]f32,
    s16: [32]ma_int16,
};
const struct_unnamed_55 = extern struct {
    config: ma_linear_resampler_config,
    inAdvanceInt: ma_uint32,
    inAdvanceFrac: ma_uint32,
    inTimeInt: ma_uint32,
    inTimeFrac: ma_uint32,
    x0: union_unnamed_56,
    x1: union_unnamed_57,
    lpf: ma_lpf,
};
pub const ma_linear_resampler = struct_unnamed_55;
pub extern fn ma_linear_resampler_init(pConfig: [*c]const ma_linear_resampler_config, pResampler: [*c]ma_linear_resampler) ma_result;
pub extern fn ma_linear_resampler_uninit(pResampler: [*c]ma_linear_resampler) void;
pub extern fn ma_linear_resampler_process_pcm_frames(pResampler: [*c]ma_linear_resampler, pFramesIn: ?*const c_void, pFrameCountIn: [*c]ma_uint64, pFramesOut: ?*c_void, pFrameCountOut: [*c]ma_uint64) ma_result;
pub extern fn ma_linear_resampler_set_rate(pResampler: [*c]ma_linear_resampler, sampleRateIn: ma_uint32, sampleRateOut: ma_uint32) ma_result;
pub extern fn ma_linear_resampler_set_rate_ratio(pResampler: [*c]ma_linear_resampler, ratioInOut: f32) ma_result;
pub extern fn ma_linear_resampler_get_required_input_frame_count(pResampler: [*c]ma_linear_resampler, outputFrameCount: ma_uint64) ma_uint64;
pub extern fn ma_linear_resampler_get_expected_output_frame_count(pResampler: [*c]ma_linear_resampler, inputFrameCount: ma_uint64) ma_uint64;
pub extern fn ma_linear_resampler_get_input_latency(pResampler: [*c]ma_linear_resampler) ma_uint64;
pub extern fn ma_linear_resampler_get_output_latency(pResampler: [*c]ma_linear_resampler) ma_uint64;
pub const ma_resample_algorithm_linear = @enumToInt(enum_unnamed_58.ma_resample_algorithm_linear);
pub const ma_resample_algorithm_speex = @enumToInt(enum_unnamed_58.ma_resample_algorithm_speex);
const enum_unnamed_58 = extern enum(c_int) {
    ma_resample_algorithm_linear = 0,
    ma_resample_algorithm_speex = 1,
    _,
};
pub const ma_resample_algorithm = enum_unnamed_58;
const struct_unnamed_60 = extern struct {
    lpfOrder: ma_uint32,
    lpfNyquistFactor: f64,
};
const struct_unnamed_61 = extern struct {
    quality: c_int,
};
const struct_unnamed_59 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRateIn: ma_uint32,
    sampleRateOut: ma_uint32,
    algorithm: ma_resample_algorithm,
    linear: struct_unnamed_60,
    speex: struct_unnamed_61,
};
pub const ma_resampler_config = struct_unnamed_59;
pub extern fn ma_resampler_config_init(format: ma_format, channels: ma_uint32, sampleRateIn: ma_uint32, sampleRateOut: ma_uint32, algorithm: ma_resample_algorithm) ma_resampler_config;
const struct_unnamed_64 = extern struct {
    pSpeexResamplerState: ?*c_void,
};
const union_unnamed_63 = extern union {
    linear: ma_linear_resampler,
    speex: struct_unnamed_64,
};
const struct_unnamed_62 = extern struct {
    config: ma_resampler_config,
    state: union_unnamed_63,
};
pub const ma_resampler = struct_unnamed_62;
pub extern fn ma_resampler_init(pConfig: [*c]const ma_resampler_config, pResampler: [*c]ma_resampler) ma_result;
pub extern fn ma_resampler_uninit(pResampler: [*c]ma_resampler) void;
pub extern fn ma_resampler_process_pcm_frames(pResampler: [*c]ma_resampler, pFramesIn: ?*const c_void, pFrameCountIn: [*c]ma_uint64, pFramesOut: ?*c_void, pFrameCountOut: [*c]ma_uint64) ma_result;
pub extern fn ma_resampler_set_rate(pResampler: [*c]ma_resampler, sampleRateIn: ma_uint32, sampleRateOut: ma_uint32) ma_result;
pub extern fn ma_resampler_set_rate_ratio(pResampler: [*c]ma_resampler, ratio: f32) ma_result;
pub extern fn ma_resampler_get_required_input_frame_count(pResampler: [*c]ma_resampler, outputFrameCount: ma_uint64) ma_uint64;
pub extern fn ma_resampler_get_expected_output_frame_count(pResampler: [*c]ma_resampler, inputFrameCount: ma_uint64) ma_uint64;
pub extern fn ma_resampler_get_input_latency(pResampler: [*c]ma_resampler) ma_uint64;
pub extern fn ma_resampler_get_output_latency(pResampler: [*c]ma_resampler) ma_uint64;
const struct_unnamed_65 = extern struct {
    format: ma_format,
    channelsIn: ma_uint32,
    channelsOut: ma_uint32,
    channelMapIn: [32]ma_channel,
    channelMapOut: [32]ma_channel,
    mixingMode: ma_channel_mix_mode,
    weights: [32][32]f32,
};
pub const ma_channel_converter_config = struct_unnamed_65;
pub extern fn ma_channel_converter_config_init(format: ma_format, channelsIn: ma_uint32, pChannelMapIn: [*c]const ma_channel, channelsOut: ma_uint32, pChannelMapOut: [*c]const ma_channel, mixingMode: ma_channel_mix_mode) ma_channel_converter_config;
const union_unnamed_67 = extern union {
    f32: [32][32]f32,
    s16: [32][32]ma_int32,
};
const struct_unnamed_66 = extern struct {
    format: ma_format,
    channelsIn: ma_uint32,
    channelsOut: ma_uint32,
    channelMapIn: [32]ma_channel,
    channelMapOut: [32]ma_channel,
    mixingMode: ma_channel_mix_mode,
    weights: union_unnamed_67,
    isPassthrough: ma_bool32,
    isSimpleShuffle: ma_bool32,
    isSimpleMonoExpansion: ma_bool32,
    isStereoToMono: ma_bool32,
    shuffleTable: [32]ma_uint8,
};
pub const ma_channel_converter = struct_unnamed_66;
pub extern fn ma_channel_converter_init(pConfig: [*c]const ma_channel_converter_config, pConverter: [*c]ma_channel_converter) ma_result;
pub extern fn ma_channel_converter_uninit(pConverter: [*c]ma_channel_converter) void;
pub extern fn ma_channel_converter_process_pcm_frames(pConverter: [*c]ma_channel_converter, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
const struct_unnamed_70 = extern struct {
    lpfOrder: ma_uint32,
    lpfNyquistFactor: f64,
};
const struct_unnamed_71 = extern struct {
    quality: c_int,
};
const struct_unnamed_69 = extern struct {
    algorithm: ma_resample_algorithm,
    allowDynamicSampleRate: ma_bool32,
    linear: struct_unnamed_70,
    speex: struct_unnamed_71,
};
const struct_unnamed_68 = extern struct {
    formatIn: ma_format,
    formatOut: ma_format,
    channelsIn: ma_uint32,
    channelsOut: ma_uint32,
    sampleRateIn: ma_uint32,
    sampleRateOut: ma_uint32,
    channelMapIn: [32]ma_channel,
    channelMapOut: [32]ma_channel,
    ditherMode: ma_dither_mode,
    channelMixMode: ma_channel_mix_mode,
    channelWeights: [32][32]f32,
    resampling: struct_unnamed_69,
};
pub const ma_data_converter_config = struct_unnamed_68;
pub extern fn ma_data_converter_config_init_default() ma_data_converter_config;
pub extern fn ma_data_converter_config_init(formatIn: ma_format, formatOut: ma_format, channelsIn: ma_uint32, channelsOut: ma_uint32, sampleRateIn: ma_uint32, sampleRateOut: ma_uint32) ma_data_converter_config;
const struct_unnamed_72 = extern struct {
    config: ma_data_converter_config,
    channelConverter: ma_channel_converter,
    resampler: ma_resampler,
    hasPreFormatConversion: ma_bool32,
    hasPostFormatConversion: ma_bool32,
    hasChannelConverter: ma_bool32,
    hasResampler: ma_bool32,
    isPassthrough: ma_bool32,
};
pub const ma_data_converter = struct_unnamed_72;
pub extern fn ma_data_converter_init(pConfig: [*c]const ma_data_converter_config, pConverter: [*c]ma_data_converter) ma_result;
pub extern fn ma_data_converter_uninit(pConverter: [*c]ma_data_converter) void;
pub extern fn ma_data_converter_process_pcm_frames(pConverter: [*c]ma_data_converter, pFramesIn: ?*const c_void, pFrameCountIn: [*c]ma_uint64, pFramesOut: ?*c_void, pFrameCountOut: [*c]ma_uint64) ma_result;
pub extern fn ma_data_converter_set_rate(pConverter: [*c]ma_data_converter, sampleRateIn: ma_uint32, sampleRateOut: ma_uint32) ma_result;
pub extern fn ma_data_converter_set_rate_ratio(pConverter: [*c]ma_data_converter, ratioInOut: f32) ma_result;
pub extern fn ma_data_converter_get_required_input_frame_count(pConverter: [*c]ma_data_converter, outputFrameCount: ma_uint64) ma_uint64;
pub extern fn ma_data_converter_get_expected_output_frame_count(pConverter: [*c]ma_data_converter, inputFrameCount: ma_uint64) ma_uint64;
pub extern fn ma_data_converter_get_input_latency(pConverter: [*c]ma_data_converter) ma_uint64;
pub extern fn ma_data_converter_get_output_latency(pConverter: [*c]ma_data_converter) ma_uint64;
pub extern fn ma_pcm_u8_to_s16(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_u8_to_s24(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_u8_to_s32(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_u8_to_f32(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_s16_to_u8(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_s16_to_s24(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_s16_to_s32(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_s16_to_f32(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_s24_to_u8(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_s24_to_s16(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_s24_to_s32(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_s24_to_f32(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_s32_to_u8(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_s32_to_s16(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_s32_to_s24(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_s32_to_f32(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_f32_to_u8(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_f32_to_s16(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_f32_to_s24(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_f32_to_s32(pOut: ?*c_void, pIn: ?*const c_void, count: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_pcm_convert(pOut: ?*c_void, formatOut: ma_format, pIn: ?*const c_void, formatIn: ma_format, sampleCount: ma_uint64, ditherMode: ma_dither_mode) void;
pub extern fn ma_convert_pcm_frames_format(pOut: ?*c_void, formatOut: ma_format, pIn: ?*const c_void, formatIn: ma_format, frameCount: ma_uint64, channels: ma_uint32, ditherMode: ma_dither_mode) void;
pub extern fn ma_deinterleave_pcm_frames(format: ma_format, channels: ma_uint32, frameCount: ma_uint64, pInterleavedPCMFrames: ?*const c_void, ppDeinterleavedPCMFrames: [*c]?*c_void) void;
pub extern fn ma_interleave_pcm_frames(format: ma_format, channels: ma_uint32, frameCount: ma_uint64, ppDeinterleavedPCMFrames: [*c]?*const c_void, pInterleavedPCMFrames: ?*c_void) void;
pub extern fn ma_get_standard_channel_map(standardChannelMap: ma_standard_channel_map, channels: ma_uint32, pChannelMap: [*c]ma_channel) void;
pub extern fn ma_channel_map_copy(pOut: [*c]ma_channel, pIn: [*c]const ma_channel, channels: ma_uint32) void;
pub extern fn ma_channel_map_valid(channels: ma_uint32, pChannelMap: [*c]const ma_channel) ma_bool32;
pub extern fn ma_channel_map_equal(channels: ma_uint32, pChannelMapA: [*c]const ma_channel, pChannelMapB: [*c]const ma_channel) ma_bool32;
pub extern fn ma_channel_map_blank(channels: ma_uint32, pChannelMap: [*c]const ma_channel) ma_bool32;
pub extern fn ma_channel_map_contains_channel_position(channels: ma_uint32, pChannelMap: [*c]const ma_channel, channelPosition: ma_channel) ma_bool32;
pub extern fn ma_convert_frames(pOut: ?*c_void, frameCountOut: ma_uint64, formatOut: ma_format, channelsOut: ma_uint32, sampleRateOut: ma_uint32, pIn: ?*const c_void, frameCountIn: ma_uint64, formatIn: ma_format, channelsIn: ma_uint32, sampleRateIn: ma_uint32) ma_uint64;
pub extern fn ma_convert_frames_ex(pOut: ?*c_void, frameCountOut: ma_uint64, pIn: ?*const c_void, frameCountIn: ma_uint64, pConfig: [*c]const ma_data_converter_config) ma_uint64;
const struct_unnamed_73 = extern struct {
    pBuffer: ?*c_void,
    subbufferSizeInBytes: ma_uint32,
    subbufferCount: ma_uint32,
    subbufferStrideInBytes: ma_uint32,
    encodedReadOffset: ma_uint32,
    encodedWriteOffset: ma_uint32,
    ownsBuffer: ma_bool32,
    clearOnWriteAcquire: ma_bool32,
    allocationCallbacks: ma_allocation_callbacks,
};
pub const ma_rb = struct_unnamed_73;
pub extern fn ma_rb_init_ex(subbufferSizeInBytes: usize, subbufferCount: usize, subbufferStrideInBytes: usize, pOptionalPreallocatedBuffer: ?*c_void, pAllocationCallbacks: [*c]const ma_allocation_callbacks, pRB: [*c]ma_rb) ma_result;
pub extern fn ma_rb_init(bufferSizeInBytes: usize, pOptionalPreallocatedBuffer: ?*c_void, pAllocationCallbacks: [*c]const ma_allocation_callbacks, pRB: [*c]ma_rb) ma_result;
pub extern fn ma_rb_uninit(pRB: [*c]ma_rb) void;
pub extern fn ma_rb_reset(pRB: [*c]ma_rb) void;
pub extern fn ma_rb_acquire_read(pRB: [*c]ma_rb, pSizeInBytes: [*c]usize, ppBufferOut: [*c]?*c_void) ma_result;
pub extern fn ma_rb_commit_read(pRB: [*c]ma_rb, sizeInBytes: usize, pBufferOut: ?*c_void) ma_result;
pub extern fn ma_rb_acquire_write(pRB: [*c]ma_rb, pSizeInBytes: [*c]usize, ppBufferOut: [*c]?*c_void) ma_result;
pub extern fn ma_rb_commit_write(pRB: [*c]ma_rb, sizeInBytes: usize, pBufferOut: ?*c_void) ma_result;
pub extern fn ma_rb_seek_read(pRB: [*c]ma_rb, offsetInBytes: usize) ma_result;
pub extern fn ma_rb_seek_write(pRB: [*c]ma_rb, offsetInBytes: usize) ma_result;
pub extern fn ma_rb_pointer_distance(pRB: [*c]ma_rb) ma_int32;
pub extern fn ma_rb_available_read(pRB: [*c]ma_rb) ma_uint32;
pub extern fn ma_rb_available_write(pRB: [*c]ma_rb) ma_uint32;
pub extern fn ma_rb_get_subbuffer_size(pRB: [*c]ma_rb) usize;
pub extern fn ma_rb_get_subbuffer_stride(pRB: [*c]ma_rb) usize;
pub extern fn ma_rb_get_subbuffer_offset(pRB: [*c]ma_rb, subbufferIndex: usize) usize;
pub extern fn ma_rb_get_subbuffer_ptr(pRB: [*c]ma_rb, subbufferIndex: usize, pBuffer: ?*c_void) ?*c_void;
const struct_unnamed_74 = extern struct {
    rb: ma_rb,
    format: ma_format,
    channels: ma_uint32,
};
pub const ma_pcm_rb = struct_unnamed_74;
pub extern fn ma_pcm_rb_init_ex(format: ma_format, channels: ma_uint32, subbufferSizeInFrames: ma_uint32, subbufferCount: ma_uint32, subbufferStrideInFrames: ma_uint32, pOptionalPreallocatedBuffer: ?*c_void, pAllocationCallbacks: [*c]const ma_allocation_callbacks, pRB: [*c]ma_pcm_rb) ma_result;
pub extern fn ma_pcm_rb_init(format: ma_format, channels: ma_uint32, bufferSizeInFrames: ma_uint32, pOptionalPreallocatedBuffer: ?*c_void, pAllocationCallbacks: [*c]const ma_allocation_callbacks, pRB: [*c]ma_pcm_rb) ma_result;
pub extern fn ma_pcm_rb_uninit(pRB: [*c]ma_pcm_rb) void;
pub extern fn ma_pcm_rb_reset(pRB: [*c]ma_pcm_rb) void;
pub extern fn ma_pcm_rb_acquire_read(pRB: [*c]ma_pcm_rb, pSizeInFrames: [*c]ma_uint32, ppBufferOut: [*c]?*c_void) ma_result;
pub extern fn ma_pcm_rb_commit_read(pRB: [*c]ma_pcm_rb, sizeInFrames: ma_uint32, pBufferOut: ?*c_void) ma_result;
pub extern fn ma_pcm_rb_acquire_write(pRB: [*c]ma_pcm_rb, pSizeInFrames: [*c]ma_uint32, ppBufferOut: [*c]?*c_void) ma_result;
pub extern fn ma_pcm_rb_commit_write(pRB: [*c]ma_pcm_rb, sizeInFrames: ma_uint32, pBufferOut: ?*c_void) ma_result;
pub extern fn ma_pcm_rb_seek_read(pRB: [*c]ma_pcm_rb, offsetInFrames: ma_uint32) ma_result;
pub extern fn ma_pcm_rb_seek_write(pRB: [*c]ma_pcm_rb, offsetInFrames: ma_uint32) ma_result;
pub extern fn ma_pcm_rb_pointer_distance(pRB: [*c]ma_pcm_rb) ma_int32;
pub extern fn ma_pcm_rb_available_read(pRB: [*c]ma_pcm_rb) ma_uint32;
pub extern fn ma_pcm_rb_available_write(pRB: [*c]ma_pcm_rb) ma_uint32;
pub extern fn ma_pcm_rb_get_subbuffer_size(pRB: [*c]ma_pcm_rb) ma_uint32;
pub extern fn ma_pcm_rb_get_subbuffer_stride(pRB: [*c]ma_pcm_rb) ma_uint32;
pub extern fn ma_pcm_rb_get_subbuffer_offset(pRB: [*c]ma_pcm_rb, subbufferIndex: ma_uint32) ma_uint32;
pub extern fn ma_pcm_rb_get_subbuffer_ptr(pRB: [*c]ma_pcm_rb, subbufferIndex: ma_uint32, pBuffer: ?*c_void) ?*c_void;
pub extern fn ma_result_description(result: ma_result) [*c]const u8;
pub extern fn ma_malloc(sz: usize, pAllocationCallbacks: [*c]const ma_allocation_callbacks) ?*c_void;
pub extern fn ma_realloc(p: ?*c_void, sz: usize, pAllocationCallbacks: [*c]const ma_allocation_callbacks) ?*c_void;
pub extern fn ma_free(p: ?*c_void, pAllocationCallbacks: [*c]const ma_allocation_callbacks) void;
pub extern fn ma_aligned_malloc(sz: usize, alignment: usize, pAllocationCallbacks: [*c]const ma_allocation_callbacks) ?*c_void;
pub extern fn ma_aligned_free(p: ?*c_void, pAllocationCallbacks: [*c]const ma_allocation_callbacks) void;
pub extern fn ma_get_format_name(format: ma_format) [*c]const u8;
pub extern fn ma_blend_f32(pOut: [*c]f32, pInA: [*c]f32, pInB: [*c]f32, factor: f32, channels: ma_uint32) void;
pub extern fn ma_get_bytes_per_sample(format: ma_format) ma_uint32;
pub fn ma_get_bytes_per_frame(arg_format: ma_format, arg_channels: ma_uint32) callconv(.C) ma_uint32 {
    var format = arg_format;
    var channels = arg_channels;
    return (ma_get_bytes_per_sample(format) *% channels);
}
pub extern fn ma_log_level_to_string(logLevel: ma_uint32) [*c]const u8;
pub const ma_backend_wasapi = @enumToInt(enum_unnamed_75.ma_backend_wasapi);
pub const ma_backend_dsound = @enumToInt(enum_unnamed_75.ma_backend_dsound);
pub const ma_backend_winmm = @enumToInt(enum_unnamed_75.ma_backend_winmm);
pub const ma_backend_coreaudio = @enumToInt(enum_unnamed_75.ma_backend_coreaudio);
pub const ma_backend_sndio = @enumToInt(enum_unnamed_75.ma_backend_sndio);
pub const ma_backend_audio4 = @enumToInt(enum_unnamed_75.ma_backend_audio4);
pub const ma_backend_oss = @enumToInt(enum_unnamed_75.ma_backend_oss);
pub const ma_backend_pulseaudio = @enumToInt(enum_unnamed_75.ma_backend_pulseaudio);
pub const ma_backend_alsa = @enumToInt(enum_unnamed_75.ma_backend_alsa);
pub const ma_backend_jack = @enumToInt(enum_unnamed_75.ma_backend_jack);
pub const ma_backend_aaudio = @enumToInt(enum_unnamed_75.ma_backend_aaudio);
pub const ma_backend_opensl = @enumToInt(enum_unnamed_75.ma_backend_opensl);
pub const ma_backend_webaudio = @enumToInt(enum_unnamed_75.ma_backend_webaudio);
pub const ma_backend_null = @enumToInt(enum_unnamed_75.ma_backend_null);
const enum_unnamed_75 = extern enum(c_int) {
    ma_backend_wasapi,
    ma_backend_dsound,
    ma_backend_winmm,
    ma_backend_coreaudio,
    ma_backend_sndio,
    ma_backend_audio4,
    ma_backend_oss,
    ma_backend_pulseaudio,
    ma_backend_alsa,
    ma_backend_jack,
    ma_backend_aaudio,
    ma_backend_opensl,
    ma_backend_webaudio,
    ma_backend_null,
    _,
};
pub const ma_backend = enum_unnamed_75;
pub const ma_device_callback_proc = ?fn ([*c]ma_device, ?*c_void, ?*const c_void, ma_uint32) callconv(.C) void;
pub const ma_stop_proc = ?fn ([*c]ma_device) callconv(.C) void;
pub const ma_log_proc = ?fn ([*c]ma_context, [*c]ma_device, ma_uint32, [*c]const u8) callconv(.C) void;
pub const ma_device_type_playback = @enumToInt(enum_unnamed_76.ma_device_type_playback);
pub const ma_device_type_capture = @enumToInt(enum_unnamed_76.ma_device_type_capture);
pub const ma_device_type_duplex = @enumToInt(enum_unnamed_76.ma_device_type_duplex);
pub const ma_device_type_loopback = @enumToInt(enum_unnamed_76.ma_device_type_loopback);
const enum_unnamed_76 = extern enum(c_int) {
    ma_device_type_playback = 1,
    ma_device_type_capture = 2,
    ma_device_type_duplex = 3,
    ma_device_type_loopback = 4,
    _,
};
pub const ma_device_type = enum_unnamed_76;
pub const ma_share_mode_shared = @enumToInt(enum_unnamed_77.ma_share_mode_shared);
pub const ma_share_mode_exclusive = @enumToInt(enum_unnamed_77.ma_share_mode_exclusive);
const enum_unnamed_77 = extern enum(c_int) {
    ma_share_mode_shared = 0,
    ma_share_mode_exclusive = 1,
    _,
};
pub const ma_share_mode = enum_unnamed_77;
pub const ma_ios_session_category_default = @enumToInt(enum_unnamed_78.ma_ios_session_category_default);
pub const ma_ios_session_category_none = @enumToInt(enum_unnamed_78.ma_ios_session_category_none);
pub const ma_ios_session_category_ambient = @enumToInt(enum_unnamed_78.ma_ios_session_category_ambient);
pub const ma_ios_session_category_solo_ambient = @enumToInt(enum_unnamed_78.ma_ios_session_category_solo_ambient);
pub const ma_ios_session_category_playback = @enumToInt(enum_unnamed_78.ma_ios_session_category_playback);
pub const ma_ios_session_category_record = @enumToInt(enum_unnamed_78.ma_ios_session_category_record);
pub const ma_ios_session_category_play_and_record = @enumToInt(enum_unnamed_78.ma_ios_session_category_play_and_record);
pub const ma_ios_session_category_multi_route = @enumToInt(enum_unnamed_78.ma_ios_session_category_multi_route);
const enum_unnamed_78 = extern enum(c_int) {
    ma_ios_session_category_default = 0,
    ma_ios_session_category_none = 1,
    ma_ios_session_category_ambient = 2,
    ma_ios_session_category_solo_ambient = 3,
    ma_ios_session_category_playback = 4,
    ma_ios_session_category_record = 5,
    ma_ios_session_category_play_and_record = 6,
    ma_ios_session_category_multi_route = 7,
    _,
};
pub const ma_ios_session_category = enum_unnamed_78;
pub const ma_ios_session_category_option_mix_with_others = @enumToInt(enum_unnamed_79.ma_ios_session_category_option_mix_with_others);
pub const ma_ios_session_category_option_duck_others = @enumToInt(enum_unnamed_79.ma_ios_session_category_option_duck_others);
pub const ma_ios_session_category_option_allow_bluetooth = @enumToInt(enum_unnamed_79.ma_ios_session_category_option_allow_bluetooth);
pub const ma_ios_session_category_option_default_to_speaker = @enumToInt(enum_unnamed_79.ma_ios_session_category_option_default_to_speaker);
pub const ma_ios_session_category_option_interrupt_spoken_audio_and_mix_with_others = @enumToInt(enum_unnamed_79.ma_ios_session_category_option_interrupt_spoken_audio_and_mix_with_others);
pub const ma_ios_session_category_option_allow_bluetooth_a2dp = @enumToInt(enum_unnamed_79.ma_ios_session_category_option_allow_bluetooth_a2dp);
pub const ma_ios_session_category_option_allow_air_play = @enumToInt(enum_unnamed_79.ma_ios_session_category_option_allow_air_play);
const enum_unnamed_79 = extern enum(c_int) {
    ma_ios_session_category_option_mix_with_others = 1,
    ma_ios_session_category_option_duck_others = 2,
    ma_ios_session_category_option_allow_bluetooth = 4,
    ma_ios_session_category_option_default_to_speaker = 8,
    ma_ios_session_category_option_interrupt_spoken_audio_and_mix_with_others = 17,
    ma_ios_session_category_option_allow_bluetooth_a2dp = 32,
    ma_ios_session_category_option_allow_air_play = 64,
    _,
};
pub const ma_ios_session_category_option = enum_unnamed_79;
const union_unnamed_80 = extern union {
    counter: ma_int64,
    counterD: f64,
};
pub const ma_timer = union_unnamed_80;
const union_unnamed_81 = extern union {
    wasapi: [64]wchar_t,
    dsound: [16]ma_uint8,
    winmm: ma_uint32,
    alsa: [256]u8,
    pulse: [256]u8,
    jack: c_int,
    coreaudio: [256]u8,
    sndio: [256]u8,
    audio4: [256]u8,
    oss: [64]u8,
    aaudio: ma_int32,
    opensl: ma_uint32,
    webaudio: [32]u8,
    nullbackend: c_int,
};
pub const ma_device_id = union_unnamed_81;
const struct_unnamed_83 = extern struct {
    isDefault: ma_bool32,
};
const struct_unnamed_82 = extern struct {
    id: ma_device_id,
    name: [256]u8,
    formatCount: ma_uint32,
    formats: [6]ma_format,
    minChannels: ma_uint32,
    maxChannels: ma_uint32,
    minSampleRate: ma_uint32,
    maxSampleRate: ma_uint32,
    _private: struct_unnamed_83,
};
pub const ma_device_info = struct_unnamed_82;
const struct_unnamed_86 = extern struct {
    lpfOrder: ma_uint32,
};
const struct_unnamed_87 = extern struct {
    quality: c_int,
};
const struct_unnamed_85 = extern struct {
    algorithm: ma_resample_algorithm,
    linear: struct_unnamed_86,
    speex: struct_unnamed_87,
};
const struct_unnamed_88 = extern struct {
    pDeviceID: [*c]const ma_device_id,
    format: ma_format,
    channels: ma_uint32,
    channelMap: [32]ma_channel,
    shareMode: ma_share_mode,
};
const struct_unnamed_89 = extern struct {
    pDeviceID: [*c]const ma_device_id,
    format: ma_format,
    channels: ma_uint32,
    channelMap: [32]ma_channel,
    shareMode: ma_share_mode,
};
const struct_unnamed_90 = extern struct {
    noAutoConvertSRC: ma_bool32,
    noDefaultQualitySRC: ma_bool32,
    noAutoStreamRouting: ma_bool32,
    noHardwareOffloading: ma_bool32,
};
const struct_unnamed_91 = extern struct {
    noMMap: ma_bool32,
    noAutoFormat: ma_bool32,
    noAutoChannels: ma_bool32,
    noAutoResample: ma_bool32,
};
const struct_unnamed_92 = extern struct {
    pStreamNamePlayback: [*c]const u8,
    pStreamNameCapture: [*c]const u8,
};
const struct_unnamed_84 = extern struct {
    deviceType: ma_device_type,
    sampleRate: ma_uint32,
    periodSizeInFrames: ma_uint32,
    periodSizeInMilliseconds: ma_uint32,
    periods: ma_uint32,
    performanceProfile: ma_performance_profile,
    noPreZeroedOutputBuffer: ma_bool32,
    noClip: ma_bool32,
    dataCallback: ma_device_callback_proc,
    stopCallback: ma_stop_proc,
    pUserData: ?*c_void,
    resampling: struct_unnamed_85,
    playback: struct_unnamed_88,
    capture: struct_unnamed_89,
    wasapi: struct_unnamed_90,
    alsa: struct_unnamed_91,
    pulse: struct_unnamed_92,
};
pub const ma_device_config = struct_unnamed_84;
const struct_unnamed_94 = extern struct {
    useVerboseDeviceEnumeration: ma_bool32,
};
const struct_unnamed_95 = extern struct {
    pApplicationName: [*c]const u8,
    pServerName: [*c]const u8,
    tryAutoSpawn: ma_bool32,
};
const struct_unnamed_96 = extern struct {
    sessionCategory: ma_ios_session_category,
    sessionCategoryOptions: ma_uint32,
    noAudioSessionActivate: ma_bool32,
    noAudioSessionDeactivate: ma_bool32,
};
const struct_unnamed_97 = extern struct {
    pClientName: [*c]const u8,
    tryStartServer: ma_bool32,
};
const struct_unnamed_93 = extern struct {
    logCallback: ma_log_proc,
    threadPriority: ma_thread_priority,
    threadStackSize: usize,
    pUserData: ?*c_void,
    allocationCallbacks: ma_allocation_callbacks,
    alsa: struct_unnamed_94,
    pulse: struct_unnamed_95,
    coreaudio: struct_unnamed_96,
    jack: struct_unnamed_97,
};
pub const ma_context_config = struct_unnamed_93;
pub const ma_enum_devices_callback_proc = ?fn ([*c]ma_context, ma_device_type, [*c]const ma_device_info, ?*c_void) callconv(.C) ma_bool32;
pub extern fn ma_context_config_init() ma_context_config;
pub extern fn ma_context_init(backends: [*c]const ma_backend, backendCount: ma_uint32, pConfig: [*c]const ma_context_config, pContext: [*c]ma_context) ma_result;
pub extern fn ma_context_uninit(pContext: [*c]ma_context) ma_result;
pub extern fn ma_context_sizeof() usize;
pub extern fn ma_context_enumerate_devices(pContext: [*c]ma_context, callback: ma_enum_devices_callback_proc, pUserData: ?*c_void) ma_result;
pub extern fn ma_context_get_devices(pContext: [*c]ma_context, ppPlaybackDeviceInfos: [*c][*c]ma_device_info, pPlaybackDeviceCount: [*c]ma_uint32, ppCaptureDeviceInfos: [*c][*c]ma_device_info, pCaptureDeviceCount: [*c]ma_uint32) ma_result;
pub extern fn ma_context_get_device_info(pContext: [*c]ma_context, deviceType: ma_device_type, pDeviceID: [*c]const ma_device_id, shareMode: ma_share_mode, pDeviceInfo: [*c]ma_device_info) ma_result;
pub extern fn ma_context_is_loopback_supported(pContext: [*c]ma_context) ma_bool32;
pub extern fn ma_device_config_init(deviceType: ma_device_type) ma_device_config;
pub extern fn ma_device_init(pContext: [*c]ma_context, pConfig: [*c]const ma_device_config, pDevice: [*c]ma_device) ma_result;
pub extern fn ma_device_init_ex(backends: [*c]const ma_backend, backendCount: ma_uint32, pContextConfig: [*c]const ma_context_config, pConfig: [*c]const ma_device_config, pDevice: [*c]ma_device) ma_result;
pub extern fn ma_device_uninit(pDevice: [*c]ma_device) void;
pub extern fn ma_device_start(pDevice: [*c]ma_device) ma_result;
pub extern fn ma_device_stop(pDevice: [*c]ma_device) ma_result;
pub extern fn ma_device_is_started(pDevice: [*c]ma_device) ma_bool32;
pub extern fn ma_device_set_master_volume(pDevice: [*c]ma_device, volume: f32) ma_result;
pub extern fn ma_device_get_master_volume(pDevice: [*c]ma_device, pVolume: [*c]f32) ma_result;
pub extern fn ma_device_set_master_gain_db(pDevice: [*c]ma_device, gainDB: f32) ma_result;
pub extern fn ma_device_get_master_gain_db(pDevice: [*c]ma_device, pGainDB: [*c]f32) ma_result;
pub extern fn ma_get_backend_name(backend: ma_backend) [*c]const u8;
pub extern fn ma_is_loopback_supported(backend: ma_backend) ma_bool32;
pub extern fn ma_spinlock_lock(pSpinlock: [*c]ma_spinlock) ma_result;
pub extern fn ma_spinlock_lock_noyield(pSpinlock: [*c]ma_spinlock) ma_result;
pub extern fn ma_spinlock_unlock(pSpinlock: [*c]ma_spinlock) ma_result;
pub extern fn ma_mutex_init(pMutex: [*c]ma_mutex) ma_result;
pub extern fn ma_mutex_uninit(pMutex: [*c]ma_mutex) void;
pub extern fn ma_mutex_lock(pMutex: [*c]ma_mutex) void;
pub extern fn ma_mutex_unlock(pMutex: [*c]ma_mutex) void;
pub extern fn ma_event_init(pEvent: [*c]ma_event) ma_result;
pub extern fn ma_event_uninit(pEvent: [*c]ma_event) void;
pub extern fn ma_event_wait(pEvent: [*c]ma_event) ma_result;
pub extern fn ma_event_signal(pEvent: [*c]ma_event) ma_result;
pub extern fn ma_scale_buffer_size(baseBufferSize: ma_uint32, scale: f32) ma_uint32;
pub extern fn ma_calculate_buffer_size_in_milliseconds_from_frames(bufferSizeInFrames: ma_uint32, sampleRate: ma_uint32) ma_uint32;
pub extern fn ma_calculate_buffer_size_in_frames_from_milliseconds(bufferSizeInMilliseconds: ma_uint32, sampleRate: ma_uint32) ma_uint32;
pub extern fn ma_copy_pcm_frames(dst: ?*c_void, src: ?*const c_void, frameCount: ma_uint64, format: ma_format, channels: ma_uint32) void;
pub extern fn ma_silence_pcm_frames(p: ?*c_void, frameCount: ma_uint64, format: ma_format, channels: ma_uint32) void;
pub fn ma_zero_pcm_frames(arg_p: ?*c_void, arg_frameCount: ma_uint64, arg_format: ma_format, arg_channels: ma_uint32) callconv(.C) void {
    var p = arg_p;
    var frameCount = arg_frameCount;
    var format = arg_format;
    var channels = arg_channels;
    ma_silence_pcm_frames(p, frameCount, format, channels);
}
pub extern fn ma_offset_pcm_frames_ptr(p: ?*c_void, offsetInFrames: ma_uint64, format: ma_format, channels: ma_uint32) ?*c_void;
pub extern fn ma_offset_pcm_frames_const_ptr(p: ?*const c_void, offsetInFrames: ma_uint64, format: ma_format, channels: ma_uint32) ?*const c_void;
pub extern fn ma_clip_samples_f32(p: [*c]f32, sampleCount: ma_uint64) void;
pub fn ma_clip_pcm_frames_f32(arg_p: [*c]f32, arg_frameCount: ma_uint64, arg_channels: ma_uint32) callconv(.C) void {
    var p = arg_p;
    var frameCount = arg_frameCount;
    var channels = arg_channels;
    ma_clip_samples_f32(p, (frameCount *% @bitCast(c_ulonglong, @as(c_ulonglong, channels))));
}
pub extern fn ma_copy_and_apply_volume_factor_u8(pSamplesOut: [*c]ma_uint8, pSamplesIn: [*c]const ma_uint8, sampleCount: ma_uint64, factor: f32) void;
pub extern fn ma_copy_and_apply_volume_factor_s16(pSamplesOut: [*c]ma_int16, pSamplesIn: [*c]const ma_int16, sampleCount: ma_uint64, factor: f32) void;
pub extern fn ma_copy_and_apply_volume_factor_s24(pSamplesOut: ?*c_void, pSamplesIn: ?*const c_void, sampleCount: ma_uint64, factor: f32) void;
pub extern fn ma_copy_and_apply_volume_factor_s32(pSamplesOut: [*c]ma_int32, pSamplesIn: [*c]const ma_int32, sampleCount: ma_uint64, factor: f32) void;
pub extern fn ma_copy_and_apply_volume_factor_f32(pSamplesOut: [*c]f32, pSamplesIn: [*c]const f32, sampleCount: ma_uint64, factor: f32) void;
pub extern fn ma_apply_volume_factor_u8(pSamples: [*c]ma_uint8, sampleCount: ma_uint64, factor: f32) void;
pub extern fn ma_apply_volume_factor_s16(pSamples: [*c]ma_int16, sampleCount: ma_uint64, factor: f32) void;
pub extern fn ma_apply_volume_factor_s24(pSamples: ?*c_void, sampleCount: ma_uint64, factor: f32) void;
pub extern fn ma_apply_volume_factor_s32(pSamples: [*c]ma_int32, sampleCount: ma_uint64, factor: f32) void;
pub extern fn ma_apply_volume_factor_f32(pSamples: [*c]f32, sampleCount: ma_uint64, factor: f32) void;
pub extern fn ma_copy_and_apply_volume_factor_pcm_frames_u8(pPCMFramesOut: [*c]ma_uint8, pPCMFramesIn: [*c]const ma_uint8, frameCount: ma_uint64, channels: ma_uint32, factor: f32) void;
pub extern fn ma_copy_and_apply_volume_factor_pcm_frames_s16(pPCMFramesOut: [*c]ma_int16, pPCMFramesIn: [*c]const ma_int16, frameCount: ma_uint64, channels: ma_uint32, factor: f32) void;
pub extern fn ma_copy_and_apply_volume_factor_pcm_frames_s24(pPCMFramesOut: ?*c_void, pPCMFramesIn: ?*const c_void, frameCount: ma_uint64, channels: ma_uint32, factor: f32) void;
pub extern fn ma_copy_and_apply_volume_factor_pcm_frames_s32(pPCMFramesOut: [*c]ma_int32, pPCMFramesIn: [*c]const ma_int32, frameCount: ma_uint64, channels: ma_uint32, factor: f32) void;
pub extern fn ma_copy_and_apply_volume_factor_pcm_frames_f32(pPCMFramesOut: [*c]f32, pPCMFramesIn: [*c]const f32, frameCount: ma_uint64, channels: ma_uint32, factor: f32) void;
pub extern fn ma_copy_and_apply_volume_factor_pcm_frames(pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64, format: ma_format, channels: ma_uint32, factor: f32) void;
pub extern fn ma_apply_volume_factor_pcm_frames_u8(pFrames: [*c]ma_uint8, frameCount: ma_uint64, channels: ma_uint32, factor: f32) void;
pub extern fn ma_apply_volume_factor_pcm_frames_s16(pFrames: [*c]ma_int16, frameCount: ma_uint64, channels: ma_uint32, factor: f32) void;
pub extern fn ma_apply_volume_factor_pcm_frames_s24(pFrames: ?*c_void, frameCount: ma_uint64, channels: ma_uint32, factor: f32) void;
pub extern fn ma_apply_volume_factor_pcm_frames_s32(pFrames: [*c]ma_int32, frameCount: ma_uint64, channels: ma_uint32, factor: f32) void;
pub extern fn ma_apply_volume_factor_pcm_frames_f32(pFrames: [*c]f32, frameCount: ma_uint64, channels: ma_uint32, factor: f32) void;
pub extern fn ma_apply_volume_factor_pcm_frames(pFrames: ?*c_void, frameCount: ma_uint64, format: ma_format, channels: ma_uint32, factor: f32) void;
pub extern fn ma_factor_to_gain_db(factor: f32) f32;
pub extern fn ma_gain_db_to_factor(gain: f32) f32;
pub const ma_data_source = c_void;
const struct_unnamed_98 = extern struct {
    onRead: ?fn (?*ma_data_source, ?*c_void, ma_uint64, [*c]ma_uint64) callconv(.C) ma_result,
    onSeek: ?fn (?*ma_data_source, ma_uint64) callconv(.C) ma_result,
    onMap: ?fn (?*ma_data_source, [*c]?*c_void, [*c]ma_uint64) callconv(.C) ma_result,
    onUnmap: ?fn (?*ma_data_source, ma_uint64) callconv(.C) ma_result,
    onGetDataFormat: ?fn (?*ma_data_source, [*c]ma_format, [*c]ma_uint32, [*c]ma_uint32) callconv(.C) ma_result,
    onGetCursor: ?fn (?*ma_data_source, [*c]ma_uint64) callconv(.C) ma_result,
    onGetLength: ?fn (?*ma_data_source, [*c]ma_uint64) callconv(.C) ma_result,
};
pub const ma_data_source_callbacks = struct_unnamed_98;
pub extern fn ma_data_source_read_pcm_frames(pDataSource: ?*ma_data_source, pFramesOut: ?*c_void, frameCount: ma_uint64, pFramesRead: [*c]ma_uint64, loop: ma_bool32) ma_result;
pub extern fn ma_data_source_seek_pcm_frames(pDataSource: ?*ma_data_source, frameCount: ma_uint64, pFramesSeeked: [*c]ma_uint64, loop: ma_bool32) ma_result;
pub extern fn ma_data_source_seek_to_pcm_frame(pDataSource: ?*ma_data_source, frameIndex: ma_uint64) ma_result;
pub extern fn ma_data_source_map(pDataSource: ?*ma_data_source, ppFramesOut: [*c]?*c_void, pFrameCount: [*c]ma_uint64) ma_result;
pub extern fn ma_data_source_unmap(pDataSource: ?*ma_data_source, frameCount: ma_uint64) ma_result;
pub extern fn ma_data_source_get_data_format(pDataSource: ?*ma_data_source, pFormat: [*c]ma_format, pChannels: [*c]ma_uint32, pSampleRate: [*c]ma_uint32) ma_result;
pub extern fn ma_data_source_get_cursor_in_pcm_frames(pDataSource: ?*ma_data_source, pCursor: [*c]ma_uint64) ma_result;
pub extern fn ma_data_source_get_length_in_pcm_frames(pDataSource: ?*ma_data_source, pLength: [*c]ma_uint64) ma_result;
const struct_unnamed_99 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sizeInFrames: ma_uint64,
    pData: ?*const c_void,
    allocationCallbacks: ma_allocation_callbacks,
};
pub const ma_audio_buffer_config = struct_unnamed_99;
pub extern fn ma_audio_buffer_config_init(format: ma_format, channels: ma_uint32, sizeInFrames: ma_uint64, pData: ?*const c_void, pAllocationCallbacks: [*c]const ma_allocation_callbacks) ma_audio_buffer_config;
const struct_unnamed_100 = extern struct {
    ds: ma_data_source_callbacks,
    format: ma_format,
    channels: ma_uint32,
    cursor: ma_uint64,
    sizeInFrames: ma_uint64,
    pData: ?*const c_void,
    allocationCallbacks: ma_allocation_callbacks,
    ownsData: ma_bool32,
    _pExtraData: [1]ma_uint8,
};
pub const ma_audio_buffer = struct_unnamed_100;
pub extern fn ma_audio_buffer_init(pConfig: [*c]const ma_audio_buffer_config, pAudioBuffer: [*c]ma_audio_buffer) ma_result;
pub extern fn ma_audio_buffer_init_copy(pConfig: [*c]const ma_audio_buffer_config, pAudioBuffer: [*c]ma_audio_buffer) ma_result;
pub extern fn ma_audio_buffer_alloc_and_init(pConfig: [*c]const ma_audio_buffer_config, ppAudioBuffer: [*c][*c]ma_audio_buffer) ma_result;
pub extern fn ma_audio_buffer_uninit(pAudioBuffer: [*c]ma_audio_buffer) void;
pub extern fn ma_audio_buffer_uninit_and_free(pAudioBuffer: [*c]ma_audio_buffer) void;
pub extern fn ma_audio_buffer_read_pcm_frames(pAudioBuffer: [*c]ma_audio_buffer, pFramesOut: ?*c_void, frameCount: ma_uint64, loop: ma_bool32) ma_uint64;
pub extern fn ma_audio_buffer_seek_to_pcm_frame(pAudioBuffer: [*c]ma_audio_buffer, frameIndex: ma_uint64) ma_result;
pub extern fn ma_audio_buffer_map(pAudioBuffer: [*c]ma_audio_buffer, ppFramesOut: [*c]?*c_void, pFrameCount: [*c]ma_uint64) ma_result;
pub extern fn ma_audio_buffer_unmap(pAudioBuffer: [*c]ma_audio_buffer, frameCount: ma_uint64) ma_result;
pub extern fn ma_audio_buffer_at_end(pAudioBuffer: [*c]ma_audio_buffer) ma_result;
pub extern fn ma_audio_buffer_get_available_frames(pAudioBuffer: [*c]ma_audio_buffer, pAvailableFrames: [*c]ma_uint64) ma_result;
pub const ma_vfs = c_void;
pub const ma_vfs_file = ma_handle;
pub const ma_seek_origin_start = @enumToInt(enum_unnamed_101.ma_seek_origin_start);
pub const ma_seek_origin_current = @enumToInt(enum_unnamed_101.ma_seek_origin_current);
pub const ma_seek_origin_end = @enumToInt(enum_unnamed_101.ma_seek_origin_end);
const enum_unnamed_101 = extern enum(c_int) {
    ma_seek_origin_start,
    ma_seek_origin_current,
    ma_seek_origin_end,
    _,
};
pub const ma_seek_origin = enum_unnamed_101;
const struct_unnamed_102 = extern struct {
    sizeInBytes: ma_uint64,
};
pub const ma_file_info = struct_unnamed_102;
const struct_unnamed_103 = extern struct {
    onOpen: ?fn (?*ma_vfs, [*c]const u8, ma_uint32, [*c]ma_vfs_file) callconv(.C) ma_result,
    onOpenW: ?fn (?*ma_vfs, [*c]const wchar_t, ma_uint32, [*c]ma_vfs_file) callconv(.C) ma_result,
    onClose: ?fn (?*ma_vfs, ma_vfs_file) callconv(.C) ma_result,
    onRead: ?fn (?*ma_vfs, ma_vfs_file, ?*c_void, usize, [*c]usize) callconv(.C) ma_result,
    onWrite: ?fn (?*ma_vfs, ma_vfs_file, ?*const c_void, usize, [*c]usize) callconv(.C) ma_result,
    onSeek: ?fn (?*ma_vfs, ma_vfs_file, ma_int64, ma_seek_origin) callconv(.C) ma_result,
    onTell: ?fn (?*ma_vfs, ma_vfs_file, [*c]ma_int64) callconv(.C) ma_result,
    onInfo: ?fn (?*ma_vfs, ma_vfs_file, [*c]ma_file_info) callconv(.C) ma_result,
};
pub const ma_vfs_callbacks = struct_unnamed_103;
pub extern fn ma_vfs_open(pVFS: ?*ma_vfs, pFilePath: [*c]const u8, openMode: ma_uint32, pFile: [*c]ma_vfs_file) ma_result;
pub extern fn ma_vfs_open_w(pVFS: ?*ma_vfs, pFilePath: [*c]const wchar_t, openMode: ma_uint32, pFile: [*c]ma_vfs_file) ma_result;
pub extern fn ma_vfs_close(pVFS: ?*ma_vfs, file: ma_vfs_file) ma_result;
pub extern fn ma_vfs_read(pVFS: ?*ma_vfs, file: ma_vfs_file, pDst: ?*c_void, sizeInBytes: usize, pBytesRead: [*c]usize) ma_result;
pub extern fn ma_vfs_write(pVFS: ?*ma_vfs, file: ma_vfs_file, pSrc: ?*const c_void, sizeInBytes: usize, pBytesWritten: [*c]usize) ma_result;
pub extern fn ma_vfs_seek(pVFS: ?*ma_vfs, file: ma_vfs_file, offset: ma_int64, origin: ma_seek_origin) ma_result;
pub extern fn ma_vfs_tell(pVFS: ?*ma_vfs, file: ma_vfs_file, pCursor: [*c]ma_int64) ma_result;
pub extern fn ma_vfs_info(pVFS: ?*ma_vfs, file: ma_vfs_file, pInfo: [*c]ma_file_info) ma_result;
pub extern fn ma_vfs_open_and_read_file(pVFS: ?*ma_vfs, pFilePath: [*c]const u8, ppData: [*c]?*c_void, pSize: [*c]usize, pAllocationCallbacks: [*c]const ma_allocation_callbacks) ma_result;
const struct_unnamed_104 = extern struct {
    cb: ma_vfs_callbacks,
    allocationCallbacks: ma_allocation_callbacks,
};
pub const ma_default_vfs = struct_unnamed_104;
pub extern fn ma_default_vfs_init(pVFS: [*c]ma_default_vfs, pAllocationCallbacks: [*c]const ma_allocation_callbacks) ma_result;
pub const ma_resource_format_wav = @enumToInt(enum_unnamed_105.ma_resource_format_wav);
const enum_unnamed_105 = extern enum(c_int) {
    ma_resource_format_wav,
    _,
};
pub const ma_resource_format = enum_unnamed_105;
const struct_unnamed_107 = extern struct {
    pVFS: ?*ma_vfs,
    file: ma_vfs_file,
};
const struct_unnamed_108 = extern struct {
    pData: [*c]const ma_uint8,
    dataSize: usize,
    currentReadPos: usize,
};
const union_unnamed_106 = extern union {
    vfs: struct_unnamed_107,
    memory: struct_unnamed_108,
};
pub const struct_ma_decoder = extern struct {
    ds: ma_data_source_callbacks,
    onRead: ma_decoder_read_proc,
    onSeek: ma_decoder_seek_proc,
    pUserData: ?*c_void,
    readPointerInBytes: ma_uint64,
    readPointerInPCMFrames: ma_uint64,
    internalFormat: ma_format,
    internalChannels: ma_uint32,
    internalSampleRate: ma_uint32,
    internalChannelMap: [32]ma_channel,
    outputFormat: ma_format,
    outputChannels: ma_uint32,
    outputSampleRate: ma_uint32,
    outputChannelMap: [32]ma_channel,
    converter: ma_data_converter,
    allocationCallbacks: ma_allocation_callbacks,
    onReadPCMFrames: ma_decoder_read_pcm_frames_proc,
    onSeekToPCMFrame: ma_decoder_seek_to_pcm_frame_proc,
    onUninit: ma_decoder_uninit_proc,
    onGetLengthInPCMFrames: ma_decoder_get_length_in_pcm_frames_proc,
    pInternalDecoder: ?*c_void,
    backend: union_unnamed_106,
};
pub const ma_decoder = struct_ma_decoder;
pub const ma_decoder_read_proc = ?fn ([*c]ma_decoder, ?*c_void, usize) callconv(.C) usize;
pub const ma_decoder_seek_proc = ?fn ([*c]ma_decoder, c_int, ma_seek_origin) callconv(.C) ma_bool32;
pub const ma_decoder_read_pcm_frames_proc = ?fn ([*c]ma_decoder, ?*c_void, ma_uint64) callconv(.C) ma_uint64;
pub const ma_decoder_seek_to_pcm_frame_proc = ?fn ([*c]ma_decoder, ma_uint64) callconv(.C) ma_result;
pub const ma_decoder_uninit_proc = ?fn ([*c]ma_decoder) callconv(.C) ma_result;
pub const ma_decoder_get_length_in_pcm_frames_proc = ?fn ([*c]ma_decoder) callconv(.C) ma_uint64;
const struct_unnamed_111 = extern struct {
    lpfOrder: ma_uint32,
};
const struct_unnamed_112 = extern struct {
    quality: c_int,
};
const struct_unnamed_110 = extern struct {
    algorithm: ma_resample_algorithm,
    linear: struct_unnamed_111,
    speex: struct_unnamed_112,
};
const struct_unnamed_109 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    channelMap: [32]ma_channel,
    channelMixMode: ma_channel_mix_mode,
    ditherMode: ma_dither_mode,
    resampling: struct_unnamed_110,
    allocationCallbacks: ma_allocation_callbacks,
};
pub const ma_decoder_config = struct_unnamed_109;
pub extern fn ma_decoder_config_init(outputFormat: ma_format, outputChannels: ma_uint32, outputSampleRate: ma_uint32) ma_decoder_config;
pub extern fn ma_decoder_init(onRead: ma_decoder_read_proc, onSeek: ma_decoder_seek_proc, pUserData: ?*c_void, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_wav(onRead: ma_decoder_read_proc, onSeek: ma_decoder_seek_proc, pUserData: ?*c_void, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_flac(onRead: ma_decoder_read_proc, onSeek: ma_decoder_seek_proc, pUserData: ?*c_void, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_mp3(onRead: ma_decoder_read_proc, onSeek: ma_decoder_seek_proc, pUserData: ?*c_void, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_vorbis(onRead: ma_decoder_read_proc, onSeek: ma_decoder_seek_proc, pUserData: ?*c_void, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_raw(onRead: ma_decoder_read_proc, onSeek: ma_decoder_seek_proc, pUserData: ?*c_void, pConfigIn: [*c]const ma_decoder_config, pConfigOut: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_memory(pData: ?*const c_void, dataSize: usize, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_memory_wav(pData: ?*const c_void, dataSize: usize, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_memory_flac(pData: ?*const c_void, dataSize: usize, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_memory_mp3(pData: ?*const c_void, dataSize: usize, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_memory_vorbis(pData: ?*const c_void, dataSize: usize, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_memory_raw(pData: ?*const c_void, dataSize: usize, pConfigIn: [*c]const ma_decoder_config, pConfigOut: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_vfs(pVFS: ?*ma_vfs, pFilePath: [*c]const u8, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_vfs_wav(pVFS: ?*ma_vfs, pFilePath: [*c]const u8, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_vfs_flac(pVFS: ?*ma_vfs, pFilePath: [*c]const u8, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_vfs_mp3(pVFS: ?*ma_vfs, pFilePath: [*c]const u8, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_vfs_vorbis(pVFS: ?*ma_vfs, pFilePath: [*c]const u8, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_vfs_w(pVFS: ?*ma_vfs, pFilePath: [*c]const wchar_t, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_vfs_wav_w(pVFS: ?*ma_vfs, pFilePath: [*c]const wchar_t, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_vfs_flac_w(pVFS: ?*ma_vfs, pFilePath: [*c]const wchar_t, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_vfs_mp3_w(pVFS: ?*ma_vfs, pFilePath: [*c]const wchar_t, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_vfs_vorbis_w(pVFS: ?*ma_vfs, pFilePath: [*c]const wchar_t, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_file(pFilePath: [*c]const u8, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_file_wav(pFilePath: [*c]const u8, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_file_flac(pFilePath: [*c]const u8, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_file_mp3(pFilePath: [*c]const u8, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_file_vorbis(pFilePath: [*c]const u8, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_file_w(pFilePath: [*c]const wchar_t, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_file_wav_w(pFilePath: [*c]const wchar_t, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_file_flac_w(pFilePath: [*c]const wchar_t, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_file_mp3_w(pFilePath: [*c]const wchar_t, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_init_file_vorbis_w(pFilePath: [*c]const wchar_t, pConfig: [*c]const ma_decoder_config, pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_uninit(pDecoder: [*c]ma_decoder) ma_result;
pub extern fn ma_decoder_get_cursor_in_pcm_frames(pDecoder: [*c]ma_decoder, pCursor: [*c]ma_uint64) ma_result;
pub extern fn ma_decoder_get_length_in_pcm_frames(pDecoder: [*c]ma_decoder) ma_uint64;
pub extern fn ma_decoder_read_pcm_frames(pDecoder: [*c]ma_decoder, pFramesOut: ?*c_void, frameCount: ma_uint64) ma_uint64;
pub extern fn ma_decoder_seek_to_pcm_frame(pDecoder: [*c]ma_decoder, frameIndex: ma_uint64) ma_result;
pub extern fn ma_decoder_get_available_frames(pDecoder: [*c]ma_decoder, pAvailableFrames: [*c]ma_uint64) ma_result;
pub extern fn ma_decode_from_vfs(pVFS: ?*ma_vfs, pFilePath: [*c]const u8, pConfig: [*c]ma_decoder_config, pFrameCountOut: [*c]ma_uint64, ppPCMFramesOut: [*c]?*c_void) ma_result;
pub extern fn ma_decode_file(pFilePath: [*c]const u8, pConfig: [*c]ma_decoder_config, pFrameCountOut: [*c]ma_uint64, ppPCMFramesOut: [*c]?*c_void) ma_result;
pub extern fn ma_decode_memory(pData: ?*const c_void, dataSize: usize, pConfig: [*c]ma_decoder_config, pFrameCountOut: [*c]ma_uint64, ppPCMFramesOut: [*c]?*c_void) ma_result;
pub const struct_ma_encoder = extern struct {
    config: ma_encoder_config,
    onWrite: ma_encoder_write_proc,
    onSeek: ma_encoder_seek_proc,
    onInit: ma_encoder_init_proc,
    onUninit: ma_encoder_uninit_proc,
    onWritePCMFrames: ma_encoder_write_pcm_frames_proc,
    pUserData: ?*c_void,
    pInternalEncoder: ?*c_void,
    pFile: ?*c_void,
};
pub const ma_encoder = struct_ma_encoder;
pub const ma_encoder_write_proc = ?fn ([*c]ma_encoder, ?*const c_void, usize) callconv(.C) usize;
pub const ma_encoder_seek_proc = ?fn ([*c]ma_encoder, c_int, ma_seek_origin) callconv(.C) ma_bool32;
pub const ma_encoder_init_proc = ?fn ([*c]ma_encoder) callconv(.C) ma_result;
pub const ma_encoder_uninit_proc = ?fn ([*c]ma_encoder) callconv(.C) void;
pub const ma_encoder_write_pcm_frames_proc = ?fn ([*c]ma_encoder, ?*const c_void, ma_uint64) callconv(.C) ma_uint64;
const struct_unnamed_113 = extern struct {
    resourceFormat: ma_resource_format,
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    allocationCallbacks: ma_allocation_callbacks,
};
pub const ma_encoder_config = struct_unnamed_113;
pub extern fn ma_encoder_config_init(resourceFormat: ma_resource_format, format: ma_format, channels: ma_uint32, sampleRate: ma_uint32) ma_encoder_config;
pub extern fn ma_encoder_init(onWrite: ma_encoder_write_proc, onSeek: ma_encoder_seek_proc, pUserData: ?*c_void, pConfig: [*c]const ma_encoder_config, pEncoder: [*c]ma_encoder) ma_result;
pub extern fn ma_encoder_init_file(pFilePath: [*c]const u8, pConfig: [*c]const ma_encoder_config, pEncoder: [*c]ma_encoder) ma_result;
pub extern fn ma_encoder_init_file_w(pFilePath: [*c]const wchar_t, pConfig: [*c]const ma_encoder_config, pEncoder: [*c]ma_encoder) ma_result;
pub extern fn ma_encoder_uninit(pEncoder: [*c]ma_encoder) void;
pub extern fn ma_encoder_write_pcm_frames(pEncoder: [*c]ma_encoder, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_uint64;
pub const ma_waveform_type_sine = @enumToInt(enum_unnamed_114.ma_waveform_type_sine);
pub const ma_waveform_type_square = @enumToInt(enum_unnamed_114.ma_waveform_type_square);
pub const ma_waveform_type_triangle = @enumToInt(enum_unnamed_114.ma_waveform_type_triangle);
pub const ma_waveform_type_sawtooth = @enumToInt(enum_unnamed_114.ma_waveform_type_sawtooth);
const enum_unnamed_114 = extern enum(c_int) {
    ma_waveform_type_sine,
    ma_waveform_type_square,
    ma_waveform_type_triangle,
    ma_waveform_type_sawtooth,
    _,
};
pub const ma_waveform_type = enum_unnamed_114;
const struct_unnamed_115 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    type: ma_waveform_type,
    amplitude: f64,
    frequency: f64,
};
pub const ma_waveform_config = struct_unnamed_115;
pub extern fn ma_waveform_config_init(format: ma_format, channels: ma_uint32, sampleRate: ma_uint32, type: ma_waveform_type, amplitude: f64, frequency: f64) ma_waveform_config;
const struct_unnamed_116 = extern struct {
    ds: ma_data_source_callbacks,
    config: ma_waveform_config,
    advance: f64,
    time: f64,
};
pub const ma_waveform = struct_unnamed_116;
pub extern fn ma_waveform_init(pConfig: [*c]const ma_waveform_config, pWaveform: [*c]ma_waveform) ma_result;
pub extern fn ma_waveform_read_pcm_frames(pWaveform: [*c]ma_waveform, pFramesOut: ?*c_void, frameCount: ma_uint64) ma_uint64;
pub extern fn ma_waveform_seek_to_pcm_frame(pWaveform: [*c]ma_waveform, frameIndex: ma_uint64) ma_result;
pub extern fn ma_waveform_set_amplitude(pWaveform: [*c]ma_waveform, amplitude: f64) ma_result;
pub extern fn ma_waveform_set_frequency(pWaveform: [*c]ma_waveform, frequency: f64) ma_result;
pub extern fn ma_waveform_set_sample_rate(pWaveform: [*c]ma_waveform, sampleRate: ma_uint32) ma_result;
pub const ma_noise_type_white = @enumToInt(enum_unnamed_117.ma_noise_type_white);
pub const ma_noise_type_pink = @enumToInt(enum_unnamed_117.ma_noise_type_pink);
pub const ma_noise_type_brownian = @enumToInt(enum_unnamed_117.ma_noise_type_brownian);
const enum_unnamed_117 = extern enum(c_int) {
    ma_noise_type_white,
    ma_noise_type_pink,
    ma_noise_type_brownian,
    _,
};
pub const ma_noise_type = enum_unnamed_117;
const struct_unnamed_118 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    type: ma_noise_type,
    seed: ma_int32,
    amplitude: f64,
    duplicateChannels: ma_bool32,
};
pub const ma_noise_config = struct_unnamed_118;
pub extern fn ma_noise_config_init(format: ma_format, channels: ma_uint32, type: ma_noise_type, seed: ma_int32, amplitude: f64) ma_noise_config;
const struct_unnamed_121 = extern struct {
    bin: [32][16]f64,
    accumulation: [32]f64,
    counter: [32]ma_uint32,
};
const struct_unnamed_122 = extern struct {
    accumulation: [32]f64,
};
const union_unnamed_120 = extern union {
    pink: struct_unnamed_121,
    brownian: struct_unnamed_122,
};
const struct_unnamed_119 = extern struct {
    ds: ma_data_source_callbacks,
    config: ma_noise_config,
    lcg: ma_lcg,
    state: union_unnamed_120,
};
pub const ma_noise = struct_unnamed_119;
pub extern fn ma_noise_init(pConfig: [*c]const ma_noise_config, pNoise: [*c]ma_noise) ma_result;
pub extern fn ma_noise_read_pcm_frames(pNoise: [*c]ma_noise, pFramesOut: ?*c_void, frameCount: ma_uint64) ma_uint64;
pub const ma_effect = c_void;
pub const struct_ma_effect_base = extern struct {
    onProcessPCMFrames: ?fn (?*ma_effect, ?*const c_void, [*c]ma_uint64, ?*c_void, [*c]ma_uint64) callconv(.C) ma_result,
    onGetRequiredInputFrameCount: ?fn (?*ma_effect, ma_uint64) callconv(.C) ma_uint64,
    onGetExpectedOutputFrameCount: ?fn (?*ma_effect, ma_uint64) callconv(.C) ma_uint64,
    onGetInputDataFormat: ?fn (?*ma_effect, [*c]ma_format, [*c]ma_uint32, [*c]ma_uint32) callconv(.C) ma_result,
    onGetOutputDataFormat: ?fn (?*ma_effect, [*c]ma_format, [*c]ma_uint32, [*c]ma_uint32) callconv(.C) ma_result,
    pPrev: [*c]ma_effect_base,
    pNext: [*c]ma_effect_base,
};
pub const ma_effect_base = struct_ma_effect_base;
pub extern fn ma_effect_process_pcm_frames(pEffect: ?*ma_effect, pFramesIn: ?*const c_void, pFrameCountIn: [*c]ma_uint64, pFramesOut: ?*c_void, pFrameCountOut: [*c]ma_uint64) ma_result;
pub extern fn ma_effect_process_pcm_frames_ex(pEffect: ?*ma_effect, pFramesIn: ?*const c_void, pFrameCountIn: [*c]ma_uint64, pFramesOut: ?*c_void, pFrameCountOut: [*c]ma_uint64, formatIn: ma_format, channelsIn: ma_uint32, formatOut: ma_format, channelsOut: ma_uint32) ma_result;
pub extern fn ma_effect_get_required_input_frame_count(pEffect: ?*ma_effect, outputFrameCount: ma_uint64) ma_uint64;
pub extern fn ma_effect_get_expected_output_frame_count(pEffect: ?*ma_effect, inputFrameCount: ma_uint64) ma_uint64;
pub extern fn ma_effect_append(pEffect: ?*ma_effect, pParent: ?*ma_effect) ma_result;
pub extern fn ma_effect_prepend(pEffect: ?*ma_effect, pChild: ?*ma_effect) ma_result;
pub extern fn ma_effect_detach(pEffect: ?*ma_effect) ma_result;
pub extern fn ma_effect_get_output_data_format(pEffect: ?*ma_effect, pFormat: [*c]ma_format, pChannels: [*c]ma_uint32, pSampleRate: [*c]ma_uint32) ma_result;
pub extern fn ma_effect_get_input_data_format(pEffect: ?*ma_effect, pFormat: [*c]ma_format, pChannels: [*c]ma_uint32, pSampleRate: [*c]ma_uint32) ma_result;
pub extern fn ma_get_accumulation_bytes_per_sample(format: ma_format) usize;
pub extern fn ma_get_accumulation_bytes_per_frame(format: ma_format, channels: ma_uint32) usize;
const struct_unnamed_123 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    accumulationBufferSizeInFrames: ma_uint64,
    pPreAllocatedAccumulationBuffer: ?*c_void,
    allocationCallbacks: ma_allocation_callbacks,
    volume: f32,
};
pub const ma_mixer_config = struct_unnamed_123;
pub extern fn ma_mixer_config_init(format: ma_format, channels: ma_uint32, accumulationBufferSizeInFrames: ma_uint64, pPreAllocatedAccumulationBuffer: ?*c_void, pAllocationCallbacks: [*c]const ma_allocation_callbacks) ma_mixer_config;
const struct_unnamed_125 = extern struct {
    frameCountIn: ma_uint64,
    frameCountOut: ma_uint64,
    isInsideBeginEnd: ma_bool32,
};
const struct_unnamed_124 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    accumulationBufferSizeInFrames: ma_uint64,
    pAccumulationBuffer: ?*c_void,
    allocationCallbacks: ma_allocation_callbacks,
    ownsAccumulationBuffer: ma_bool32,
    volume: f32,
    pEffect: ?*ma_effect,
    mixingState: struct_unnamed_125,
};
pub const ma_mixer = struct_unnamed_124;
pub extern fn ma_mixer_init(pConfig: [*c]ma_mixer_config, pMixer: [*c]ma_mixer) ma_result;
pub extern fn ma_mixer_uninit(pMixer: [*c]ma_mixer) void;
pub extern fn ma_mixer_begin(pMixer: [*c]ma_mixer, pParentMixer: [*c]ma_mixer, pFrameCountOut: [*c]ma_uint64, pFrameCountIn: [*c]ma_uint64) ma_result;
pub extern fn ma_mixer_end(pMixer: [*c]ma_mixer, pParentMixer: [*c]ma_mixer, pFramesOut: ?*c_void, outputOffsetInFrames: ma_uint64) ma_result;
pub extern fn ma_mixer_mix_pcm_frames(pMixer: [*c]ma_mixer, pFramesIn: ?*const c_void, offsetInFrames: ma_uint64, frameCountIn: ma_uint64, volume: f32, formatIn: ma_format, channelsIn: ma_uint32) ma_result;
pub extern fn ma_mixer_mix_data_source(pMixer: [*c]ma_mixer, pDataSource: ?*ma_data_source, offsetInFrames: ma_uint64, frameCountIn: ma_uint64, pFrameCountOut: [*c]ma_uint64, volume: f32, pEffect: ?*ma_effect, loop: ma_bool32) ma_result;
pub extern fn ma_mixer_mix_rb(pMixer: [*c]ma_mixer, pRB: [*c]ma_rb, offsetInFrames: ma_uint64, frameCountIn: ma_uint64, pFrameCountOut: [*c]ma_uint64, volume: f32, pEffect: ?*ma_effect, formatIn: ma_format, channelsIn: ma_uint32) ma_result;
pub extern fn ma_mixer_mix_pcm_rb(pMixer: [*c]ma_mixer, pRB: [*c]ma_pcm_rb, offsetInFrames: ma_uint64, frameCountIn: ma_uint64, pFrameCountOut: [*c]ma_uint64, volume: f32, pEffect: ?*ma_effect) ma_result;
pub extern fn ma_mixer_set_volume(pMixer: [*c]ma_mixer, volume: f32) ma_result;
pub extern fn ma_mixer_get_volume(pMixer: [*c]ma_mixer, pVolume: [*c]f32) ma_result;
pub extern fn ma_mixer_set_gain_db(pMixer: [*c]ma_mixer, gainDB: f32) ma_result;
pub extern fn ma_mixer_get_gain_db(pMixer: [*c]ma_mixer, pGainDB: [*c]f32) ma_result;
pub extern fn ma_mixer_set_effect(pMixer: [*c]ma_mixer, pEffect: ?*ma_effect) ma_result;
pub extern fn ma_mixer_get_effect(pMixer: [*c]ma_mixer, ppEffect: [*c]?*ma_effect) ma_result;
pub extern fn ma_mixer_get_output_data_format(pMixer: [*c]ma_mixer, pFormat: [*c]ma_format, pChannels: [*c]ma_uint32) ma_result;
pub extern fn ma_mixer_get_input_data_format(pMixer: [*c]ma_mixer, pFormat: [*c]ma_format, pChannels: [*c]ma_uint32) ma_result;
pub const ma_resource_manager_data_buffer_encoding_encoded = @enumToInt(enum_unnamed_126.ma_resource_manager_data_buffer_encoding_encoded);
pub const ma_resource_manager_data_buffer_encoding_decoded = @enumToInt(enum_unnamed_126.ma_resource_manager_data_buffer_encoding_decoded);
const enum_unnamed_126 = extern enum(c_int) {
    ma_resource_manager_data_buffer_encoding_encoded,
    ma_resource_manager_data_buffer_encoding_decoded,
    _,
};
pub const ma_resource_manager_data_buffer_encoding = enum_unnamed_126;
pub const ma_resource_manager_data_buffer_connector_unknown = @enumToInt(enum_unnamed_127.ma_resource_manager_data_buffer_connector_unknown);
pub const ma_resource_manager_data_buffer_connector_decoder = @enumToInt(enum_unnamed_127.ma_resource_manager_data_buffer_connector_decoder);
pub const ma_resource_manager_data_buffer_connector_buffer = @enumToInt(enum_unnamed_127.ma_resource_manager_data_buffer_connector_buffer);
const enum_unnamed_127 = extern enum(c_int) {
    ma_resource_manager_data_buffer_connector_unknown,
    ma_resource_manager_data_buffer_connector_decoder,
    ma_resource_manager_data_buffer_connector_buffer,
    _,
};
pub const ma_resource_manager_data_buffer_connector = enum_unnamed_127;
pub const struct_ma_resource_manager = extern struct {
    config: ma_resource_manager_config,
    pRootDataBufferNode: [*c]ma_resource_manager_data_buffer_node,
    dataBufferLock: ma_mutex,
    jobThreads: [64]ma_thread,
    jobQueue: ma_job_queue,
    defaultVFS: ma_default_vfs,
};
pub const ma_resource_manager = struct_ma_resource_manager;
pub const struct_ma_resource_manager_data_buffer_node = extern struct {
    hashedName32: ma_uint32,
    refCount: ma_uint32,
    result: ma_result,
    executionCounter: ma_uint32,
    executionPointer: ma_uint32,
    isDataOwnedByResourceManager: ma_bool32,
    data: ma_resource_manager_memory_buffer,
    pParent: [*c]ma_resource_manager_data_buffer_node,
    pChildLo: [*c]ma_resource_manager_data_buffer_node,
    pChildHi: [*c]ma_resource_manager_data_buffer_node,
};
pub const ma_resource_manager_data_buffer_node = struct_ma_resource_manager_data_buffer_node;
const union_unnamed_128 = extern union {
    decoder: ma_decoder,
    buffer: ma_audio_buffer,
};
pub const struct_ma_resource_manager_data_buffer = extern struct {
    ds: ma_data_source_callbacks,
    pResourceManager: [*c]ma_resource_manager,
    flags: ma_uint32,
    pNode: [*c]ma_resource_manager_data_buffer_node,
    cursorInPCMFrames: ma_uint64,
    lengthInPCMFrames: ma_uint64,
    seekToCursorOnNextRead: ma_bool32,
    isLooping: ma_bool32,
    connectorType: ma_resource_manager_data_buffer_connector,
    connector: union_unnamed_128,
};
pub const ma_resource_manager_data_buffer = struct_ma_resource_manager_data_buffer;
pub const struct_ma_resource_manager_data_stream = extern struct {
    ds: ma_data_source_callbacks,
    pResourceManager: [*c]ma_resource_manager,
    flags: ma_uint32,
    decoder: ma_decoder,
    isDecoderInitialized: ma_bool32,
    totalLengthInPCMFrames: ma_uint64,
    relativeCursor: ma_uint32,
    absoluteCursor: ma_uint64,
    currentPageIndex: ma_uint32,
    executionCounter: ma_uint32,
    executionPointer: ma_uint32,
    isLooping: ma_bool32,
    pPageData: ?*c_void,
    pageFrameCount: [2]ma_uint32,
    result: ma_result,
    isDecoderAtEnd: ma_bool32,
    isPageValid: [2]ma_bool32,
    seekCounter: ma_bool32,
};
pub const ma_resource_manager_data_stream = struct_ma_resource_manager_data_stream;
const union_unnamed_129 = extern union {
    buffer: ma_resource_manager_data_buffer,
    stream: ma_resource_manager_data_stream,
};
pub const struct_ma_resource_manager_data_source = extern struct {
    unnamed_0: union_unnamed_129,
    flags: ma_uint32,
    executionCounter: ma_uint32,
    executionPointer: ma_uint32,
};
pub const ma_resource_manager_data_source = struct_ma_resource_manager_data_source;
const struct_unnamed_131 = extern struct {
    bitfield: ma_uint32,
};
const struct_unnamed_130 = extern struct {
    groups: [32]struct_unnamed_131,
    slots: [1024]ma_uint32,
    count: ma_uint32,
};
pub const ma_slot_allocator = struct_unnamed_130;
pub extern fn ma_slot_allocator_init(pAllocator: [*c]ma_slot_allocator) ma_result;
pub extern fn ma_slot_allocator_alloc(pAllocator: [*c]ma_slot_allocator, pSlot: [*c]ma_uint64) ma_result;
pub extern fn ma_slot_allocator_free(pAllocator: [*c]ma_slot_allocator, slot: ma_uint64) ma_result;
pub const ma_async_notification = c_void;
const struct_unnamed_132 = extern struct {
    onSignal: ?fn (?*ma_async_notification, c_int) callconv(.C) void,
};
pub const ma_async_notification_callbacks = struct_unnamed_132;
pub extern fn ma_async_notification_signal(pNotification: ?*ma_async_notification, code: c_int) ma_result;
const struct_unnamed_133 = extern struct {
    cb: ma_async_notification_callbacks,
    e: ma_event,
};
pub const ma_async_notification_event = struct_unnamed_133;
pub extern fn ma_async_notification_event_init(pNotificationEvent: [*c]ma_async_notification_event) ma_result;
pub extern fn ma_async_notification_event_uninit(pNotificationEvent: [*c]ma_async_notification_event) ma_result;
pub extern fn ma_async_notification_event_wait(pNotificationEvent: [*c]ma_async_notification_event) ma_result;
pub extern fn ma_async_notification_event_signal(pNotificationEvent: [*c]ma_async_notification_event) ma_result;
const struct_unnamed_136 = extern struct {
    code: ma_uint16,
    slot: ma_uint16,
    refcount: ma_uint32,
};
const union_unnamed_135 = extern union {
    unnamed_0: struct_unnamed_136,
    allocation: ma_uint64,
};
const struct_unnamed_138 = extern struct {
    pDataBuffer: [*c]ma_resource_manager_data_buffer,
    pFilePath: [*c]u8,
    pNotification: ?*ma_async_notification,
};
const struct_unnamed_139 = extern struct {
    pDataBuffer: [*c]ma_resource_manager_data_buffer,
    pNotification: ?*ma_async_notification,
};
const struct_unnamed_140 = extern struct {
    pDataBuffer: [*c]ma_resource_manager_data_buffer,
    pDecoder: [*c]ma_decoder,
    pCompletedNotification: ?*ma_async_notification,
    pData: ?*c_void,
    dataSizeInBytes: usize,
    decodedFrameCount: ma_uint64,
    isUnknownLength: ma_bool32,
};
const struct_unnamed_141 = extern struct {
    pDataStream: [*c]ma_resource_manager_data_stream,
    pFilePath: [*c]u8,
    pNotification: ?*ma_async_notification,
};
const struct_unnamed_142 = extern struct {
    pDataStream: [*c]ma_resource_manager_data_stream,
    pNotification: ?*ma_async_notification,
};
const struct_unnamed_143 = extern struct {
    pDataStream: [*c]ma_resource_manager_data_stream,
    pageIndex: ma_uint32,
};
const struct_unnamed_144 = extern struct {
    pDataStream: [*c]ma_resource_manager_data_stream,
    frameIndex: ma_uint64,
};
const struct_unnamed_145 = extern struct {
    data0: ma_uintptr,
    data1: ma_uintptr,
};
const union_unnamed_137 = extern union {
    loadDataBuffer: struct_unnamed_138,
    freeDataBuffer: struct_unnamed_139,
    pageDataBuffer: struct_unnamed_140,
    loadDataStream: struct_unnamed_141,
    freeDataStream: struct_unnamed_142,
    pageDataStream: struct_unnamed_143,
    seekDataStream: struct_unnamed_144,
    custom: struct_unnamed_145,
};
const struct_unnamed_134 = extern struct {
    toc: union_unnamed_135,
    next: ma_uint64,
    order: ma_uint32,
    unnamed_0: union_unnamed_137,
};
pub const ma_job = struct_unnamed_134;
pub extern fn ma_job_init(code: ma_uint16) ma_job;
const struct_unnamed_146 = extern struct {
    flags: ma_uint32,
    head: ma_uint64,
    tail: ma_uint64,
    sem: ma_semaphore,
    allocator: ma_slot_allocator,
    jobs: [1024]ma_job,
};
pub const ma_job_queue = struct_unnamed_146;
pub extern fn ma_job_queue_init(flags: ma_uint32, pQueue: [*c]ma_job_queue) ma_result;
pub extern fn ma_job_queue_uninit(pQueue: [*c]ma_job_queue) ma_result;
pub extern fn ma_job_queue_post(pQueue: [*c]ma_job_queue, pJob: [*c]const ma_job) ma_result;
pub extern fn ma_job_queue_next(pQueue: [*c]ma_job_queue, pJob: [*c]ma_job) ma_result;
const struct_unnamed_147 = extern struct {
    pData: ?*const c_void,
    frameCount: ma_uint64,
    decodedFrameCount: ma_uint64,
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
};
pub const ma_decoded_data = struct_unnamed_147;
const struct_unnamed_148 = extern struct {
    pData: ?*const c_void,
    sizeInBytes: usize,
};
pub const ma_encoded_data = struct_unnamed_148;
const union_unnamed_150 = extern union {
    decoded: ma_decoded_data,
    encoded: ma_encoded_data,
};
const struct_unnamed_149 = extern struct {
    type: ma_resource_manager_data_buffer_encoding,
    unnamed_0: union_unnamed_150,
};
pub const ma_resource_manager_memory_buffer = struct_unnamed_149;
const struct_unnamed_151 = extern struct {
    allocationCallbacks: ma_allocation_callbacks,
    decodedFormat: ma_format,
    decodedChannels: ma_uint32,
    decodedSampleRate: ma_uint32,
    jobThreadCount: ma_uint32,
    flags: ma_uint32,
    pVFS: ?*ma_vfs,
};
pub const ma_resource_manager_config = struct_unnamed_151;
pub extern fn ma_resource_manager_config_init(...) ma_resource_manager_config;
pub extern fn ma_resource_manager_init(pConfig: [*c]const ma_resource_manager_config, pResourceManager: [*c]ma_resource_manager) ma_result;
pub extern fn ma_resource_manager_uninit(pResourceManager: [*c]ma_resource_manager) void;
pub extern fn ma_resource_manager_register_decoded_data(pResourceManager: [*c]ma_resource_manager, pName: [*c]const u8, pData: ?*const c_void, frameCount: ma_uint64, format: ma_format, channels: ma_uint32, sampleRate: ma_uint32) ma_result;
pub extern fn ma_resource_manager_register_encoded_data(pResourceManager: [*c]ma_resource_manager, pName: [*c]const u8, pData: ?*const c_void, sizeInBytes: usize) ma_result;
pub extern fn ma_resource_manager_unregister_data(pResourceManager: [*c]ma_resource_manager, pName: [*c]const u8) ma_result;
pub extern fn ma_resource_manager_data_buffer_init(pResourceManager: [*c]ma_resource_manager, pFilePath: [*c]const u8, flags: ma_uint32, pNotification: ?*ma_async_notification, pDataBuffer: [*c]ma_resource_manager_data_buffer) ma_result;
pub extern fn ma_resource_manager_data_buffer_uninit(pDataBuffer: [*c]ma_resource_manager_data_buffer) ma_result;
pub extern fn ma_resource_manager_data_buffer_read_pcm_frames(pDataBuffer: [*c]ma_resource_manager_data_buffer, pFramesOut: ?*c_void, frameCount: ma_uint64, pFramesRead: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_buffer_seek_to_pcm_frame(pDataBuffer: [*c]ma_resource_manager_data_buffer, frameIndex: ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_buffer_map(pDataBuffer: [*c]ma_resource_manager_data_buffer, ppFramesOut: [*c]?*c_void, pFrameCount: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_buffer_unmap(pDataBuffer: [*c]ma_resource_manager_data_buffer, frameCount: ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_buffer_get_data_format(pDataBuffer: [*c]ma_resource_manager_data_buffer, pFormat: [*c]ma_format, pChannels: [*c]ma_uint32, pSampleRate: [*c]ma_uint32) ma_result;
pub extern fn ma_resource_manager_data_buffer_get_cursor_in_pcm_frames(pDataBuffer: [*c]ma_resource_manager_data_buffer, pCursor: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_buffer_get_length_in_pcm_frames(pDataBuffer: [*c]ma_resource_manager_data_buffer, pLength: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_buffer_result(pDataBuffer: [*c]const ma_resource_manager_data_buffer) ma_result;
pub extern fn ma_resource_manager_data_buffer_set_looping(pDataBuffer: [*c]ma_resource_manager_data_buffer, isLooping: ma_bool32) ma_result;
pub extern fn ma_resource_manager_data_buffer_get_looping(pDataBuffer: [*c]const ma_resource_manager_data_buffer, pIsLooping: [*c]ma_bool32) ma_result;
pub extern fn ma_resource_manager_data_buffer_get_available_frames(pDataBuffer: [*c]ma_resource_manager_data_buffer, pAvailableFrames: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_stream_init(pResourceManager: [*c]ma_resource_manager, pFilePath: [*c]const u8, flags: ma_uint32, pNotification: ?*ma_async_notification, pDataStream: [*c]ma_resource_manager_data_stream) ma_result;
pub extern fn ma_resource_manager_data_stream_uninit(pDataStream: [*c]ma_resource_manager_data_stream) ma_result;
pub extern fn ma_resource_manager_data_stream_read_pcm_frames(pDataStream: [*c]ma_resource_manager_data_stream, pFramesOut: ?*c_void, frameCount: ma_uint64, pFramesRead: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_stream_seek_to_pcm_frame(pDataStream: [*c]ma_resource_manager_data_stream, frameIndex: ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_stream_map(pDataStream: [*c]ma_resource_manager_data_stream, ppFramesOut: [*c]?*c_void, pFrameCount: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_stream_unmap(pDataStream: [*c]ma_resource_manager_data_stream, frameCount: ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_stream_get_data_format(pDataStream: [*c]ma_resource_manager_data_stream, pFormat: [*c]ma_format, pChannels: [*c]ma_uint32, pSampleRate: [*c]ma_uint32) ma_result;
pub extern fn ma_resource_manager_data_stream_get_cursor_in_pcm_frames(pDataStream: [*c]ma_resource_manager_data_stream, pCursor: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_stream_get_length_in_pcm_frames(pDataStream: [*c]ma_resource_manager_data_stream, pLength: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_stream_result(pDataStream: [*c]const ma_resource_manager_data_stream) ma_result;
pub extern fn ma_resource_manager_data_stream_set_looping(pDataStream: [*c]ma_resource_manager_data_stream, isLooping: ma_bool32) ma_result;
pub extern fn ma_resource_manager_data_stream_get_looping(pDataStream: [*c]const ma_resource_manager_data_stream, pIsLooping: [*c]ma_bool32) ma_result;
pub extern fn ma_resource_manager_data_stream_get_available_frames(pDataStream: [*c]ma_resource_manager_data_stream, pAvailableFrames: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_source_init(pResourceManager: [*c]ma_resource_manager, pName: [*c]const u8, flags: ma_uint32, pNotification: ?*ma_async_notification, pDataSource: [*c]ma_resource_manager_data_source) ma_result;
pub extern fn ma_resource_manager_data_source_uninit(pDataSource: [*c]ma_resource_manager_data_source) ma_result;
pub extern fn ma_resource_manager_data_source_read_pcm_frames(pDataSource: [*c]ma_resource_manager_data_source, pFramesOut: ?*c_void, frameCount: ma_uint64, pFramesRead: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_source_seek_to_pcm_frame(pDataSource: [*c]ma_resource_manager_data_source, frameIndex: ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_source_map(pDataSource: [*c]ma_resource_manager_data_source, ppFramesOut: [*c]?*c_void, pFrameCount: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_source_unmap(pDataSource: [*c]ma_resource_manager_data_source, frameCount: ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_source_get_data_format(pDataSource: [*c]ma_resource_manager_data_source, pFormat: [*c]ma_format, pChannels: [*c]ma_uint32, pSampleRate: [*c]ma_uint32) ma_result;
pub extern fn ma_resource_manager_data_source_get_cursor_in_pcm_frames(pDataSource: [*c]ma_resource_manager_data_source, pCursor: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_source_get_length_in_pcm_frames(pDataSource: [*c]ma_resource_manager_data_source, pLength: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_data_source_result(pDataSource: [*c]const ma_resource_manager_data_source) ma_result;
pub extern fn ma_resource_manager_data_source_set_looping(pDataSource: [*c]ma_resource_manager_data_source, isLooping: ma_bool32) ma_result;
pub extern fn ma_resource_manager_data_source_get_looping(pDataSource: [*c]const ma_resource_manager_data_source, pIsLooping: [*c]ma_bool32) ma_result;
pub extern fn ma_resource_manager_data_source_get_available_frames(pDataSource: [*c]ma_resource_manager_data_source, pAvailableFrames: [*c]ma_uint64) ma_result;
pub extern fn ma_resource_manager_post_job(pResourceManager: [*c]ma_resource_manager, pJob: [*c]const ma_job) ma_result;
pub extern fn ma_resource_manager_post_job_quit(pResourceManager: [*c]ma_resource_manager) ma_result;
pub extern fn ma_resource_manager_next_job(pResourceManager: [*c]ma_resource_manager, pJob: [*c]ma_job) ma_result;
pub extern fn ma_resource_manager_process_job(pResourceManager: [*c]ma_resource_manager, pJob: [*c]ma_job) ma_result;
pub extern fn ma_resource_manager_process_next_job(pResourceManager: [*c]ma_resource_manager) ma_result;
pub const struct_ma_engine = extern struct {
    pResourceManager: [*c]ma_resource_manager,
    pDevice: [*c]ma_device,
    fixedRB: ma_pcm_rb,
    listener: ma_listener,
    masterSoundGroup: ma_sound_group,
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    periodSizeInFrames: ma_uint32,
    periodSizeInMilliseconds: ma_uint32,
    allocationCallbacks: ma_allocation_callbacks,
    ownsResourceManager: ma_bool32,
    ownsDevice: ma_bool32,
};
pub const ma_engine = struct_ma_engine;
pub const struct_ma_sound = extern struct {
    pEngine: [*c]ma_engine,
    pDataSource: ?*ma_data_source,
    pGroup: [*c]ma_sound_group,
    pPrevSoundInGroup: [*c]ma_sound,
    pNextSoundInGroup: [*c]ma_sound,
    effect: ma_engine_effect,
    volume: f32,
    seekTarget: ma_uint64,
    runningTimeInEngineFrames: ma_uint64,
    startDelayInEngineFrames: ma_uint64,
    stopDelayInEngineFrames: ma_uint64,
    stopDelayInEngineFramesRemaining: ma_uint64,
    isPlaying: ma_bool32,
    isMixing: ma_bool32,
    isLooping: ma_bool32,
    atEnd: ma_bool32,
    ownsDataSource: ma_bool32,
    _isInternal: ma_bool32,
    resourceManagerDataSource: ma_resource_manager_data_source,
};
pub const ma_sound = struct_ma_sound;
pub const struct_ma_sound_group = extern struct {
    pEngine: [*c]ma_engine,
    pParent: [*c]ma_sound_group,
    pFirstChild: [*c]ma_sound_group,
    pPrevSibling: [*c]ma_sound_group,
    pNextSibling: [*c]ma_sound_group,
    pFirstSoundInGroup: [*c]ma_sound,
    effect: ma_engine_effect,
    mixer: ma_mixer,
    lock: ma_mutex,
    runningTimeInEngineFrames: ma_uint64,
    startDelayInEngineFrames: ma_uint64,
    stopDelayInEngineFrames: ma_uint64,
    stopDelayInEngineFramesRemaining: ma_uint64,
    isPlaying: ma_bool32,
};
pub const ma_sound_group = struct_ma_sound_group;
pub const struct_ma_listener = extern struct {
    position: ma_vec3,
    rotation: ma_quat,
};
pub const ma_listener = struct_ma_listener;
const struct_unnamed_152 = extern struct {
    x: f32,
    y: f32,
    z: f32,
};
pub const ma_vec3 = struct_unnamed_152;
pub fn ma_vec3f(arg_x: f32, arg_y: f32, arg_z: f32) callconv(.C) ma_vec3 {
    var x = arg_x;
    var y = arg_y;
    var z = arg_z;
    var v: ma_vec3 = undefined;
    v.x = x;
    v.y = y;
    v.z = z;
    return v;
}
const struct_unnamed_153 = extern struct {
    x: f32,
    y: f32,
    z: f32,
    w: f32,
};
pub const ma_quat = struct_unnamed_153;
pub fn ma_quatf(arg_x: f32, arg_y: f32, arg_z: f32, arg_w: f32) callconv(.C) ma_quat {
    var x = arg_x;
    var y = arg_y;
    var z = arg_z;
    var w = arg_w;
    var q: ma_quat = undefined;
    q.x = x;
    q.y = y;
    q.z = z;
    q.w = w;
    return q;
}
pub const ma_pan_mode_balance = @enumToInt(enum_unnamed_154.ma_pan_mode_balance);
pub const ma_pan_mode_pan = @enumToInt(enum_unnamed_154.ma_pan_mode_pan);
const enum_unnamed_154 = extern enum(c_int) {
    ma_pan_mode_balance = 0,
    ma_pan_mode_pan = 1,
    _,
};
pub const ma_pan_mode = enum_unnamed_154;
const struct_unnamed_155 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    mode: ma_pan_mode,
    pan: f32,
};
pub const ma_panner_config = struct_unnamed_155;
pub extern fn ma_panner_config_init(format: ma_format, channels: ma_uint32) ma_panner_config;
const struct_unnamed_156 = extern struct {
    effect: ma_effect_base,
    format: ma_format,
    channels: ma_uint32,
    mode: ma_pan_mode,
    pan: f32,
};
pub const ma_panner = struct_unnamed_156;
pub extern fn ma_panner_init(pConfig: [*c]const ma_panner_config, pPanner: [*c]ma_panner) ma_result;
pub extern fn ma_panner_process_pcm_frames(pPanner: [*c]ma_panner, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_panner_set_mode(pPanner: [*c]ma_panner, mode: ma_pan_mode) ma_result;
pub extern fn ma_panner_set_pan(pPanner: [*c]ma_panner, pan: f32) ma_result;
const struct_unnamed_157 = extern struct {
    pEngine: [*c]ma_engine,
    format: ma_format,
    channels: ma_uint32,
    position: ma_vec3,
    rotation: ma_quat,
};
pub const ma_spatializer_config = struct_unnamed_157;
pub extern fn ma_spatializer_config_init(pEngine: [*c]ma_engine, format: ma_format, channels: ma_uint32) ma_spatializer_config;
const struct_unnamed_158 = extern struct {
    effect: ma_effect_base,
    pEngine: [*c]ma_engine,
    format: ma_format,
    channels: ma_uint32,
    position: ma_vec3,
    rotation: ma_quat,
};
pub const ma_spatializer = struct_unnamed_158;
pub extern fn ma_spatializer_init(pConfig: [*c]const ma_spatializer_config, pSpatializer: [*c]ma_spatializer) ma_result;
pub extern fn ma_spatializer_process_pcm_frames(pSpatializer: [*c]ma_spatializer, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_spatializer_set_position(pSpatializer: [*c]ma_spatializer, position: ma_vec3) ma_result;
pub extern fn ma_spatializer_set_rotation(pSpatializer: [*c]ma_spatializer, rotation: ma_quat) ma_result;
const struct_unnamed_160 = extern struct {
    volumeBeg: f32,
    volumeEnd: f32,
    timeInFramesBeg: ma_uint64,
    timeInFramesEnd: ma_uint64,
    autoReset: ma_bool32,
};
const struct_unnamed_159 = extern struct {
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    state: [2]struct_unnamed_160,
};
pub const ma_dual_fader_config = struct_unnamed_159;
pub extern fn ma_dual_fader_config_init(format: ma_format, channels: ma_uint32, sampleRate: ma_uint32) ma_dual_fader_config;
const struct_unnamed_161 = extern struct {
    effect: ma_effect_base,
    config: ma_dual_fader_config,
    timeInFramesCur: ma_uint64,
};
pub const ma_dual_fader = struct_unnamed_161;
pub extern fn ma_dual_fader_init(pConfig: [*c]const ma_dual_fader_config, pFader: [*c]ma_dual_fader) ma_result;
pub extern fn ma_dual_fader_process_pcm_frames(pFader: [*c]ma_dual_fader, pFramesOut: ?*c_void, pFramesIn: ?*const c_void, frameCount: ma_uint64) ma_result;
pub extern fn ma_dual_fader_get_data_format(pFader: [*c]const ma_dual_fader, pFormat: [*c]ma_format, pChannels: [*c]ma_uint32, pSampleRate: [*c]ma_uint32) ma_result;
pub extern fn ma_dual_fader_set_fade(pFader: [*c]ma_dual_fader, index: ma_uint32, volumeBeg: f32, volumeEnd: f32, timeInFramesBeg: ma_uint64, timeInFramesEnd: ma_uint64) ma_result;
pub extern fn ma_dual_fader_set_time(pFader: [*c]ma_dual_fader, currentTimeInFrames: ma_uint64) ma_result;
pub extern fn ma_dual_fader_get_time(pFader: [*c]const ma_dual_fader, pCurrentTimeInFrames: [*c]ma_uint64) ma_result;
pub extern fn ma_dual_fader_is_time_past_fade(pFader: [*c]const ma_dual_fader, index: ma_uint32) ma_bool32;
pub extern fn ma_dual_fader_is_time_past_both_fades(pFader: [*c]const ma_dual_fader) ma_bool32;
pub extern fn ma_dual_fader_is_in_fade(pFader: [*c]const ma_dual_fader, index: ma_uint32) ma_bool32;
pub extern fn ma_dual_fader_reset_fade(pFader: [*c]ma_dual_fader, index: ma_uint32) ma_result;
pub extern fn ma_dual_fader_set_auto_reset(pFader: [*c]ma_dual_fader, index: ma_uint32, autoReset: ma_bool32) ma_result;
const struct_unnamed_162 = extern struct {
    baseEffect: ma_effect_base,
    pEngine: [*c]ma_engine,
    pPreEffect: ?*ma_effect,
    panner: ma_panner,
    spatializer: ma_spatializer,
    fader: ma_dual_fader,
    pitch: f32,
    oldPitch: f32,
    converter: ma_data_converter,
    timeInFrames: ma_uint64,
    isSpatial: ma_bool32,
};
pub const ma_engine_effect = struct_unnamed_162;
const struct_unnamed_163 = extern struct {
    pResourceManager: [*c]ma_resource_manager,
    pContext: [*c]ma_context,
    pDevice: [*c]ma_device,
    fixedRB: ma_pcm_rb,
    format: ma_format,
    channels: ma_uint32,
    sampleRate: ma_uint32,
    periodSizeInFrames: ma_uint32,
    periodSizeInMilliseconds: ma_uint32,
    pPlaybackDeviceID: [*c]ma_device_id,
    allocationCallbacks: ma_allocation_callbacks,
    noAutoStart: ma_bool32,
    pResourceManagerVFS: ?*ma_vfs,
};
pub const ma_engine_config = struct_unnamed_163;
pub extern fn ma_engine_config_init_default(...) ma_engine_config;
pub extern fn ma_engine_init(pConfig: [*c]const ma_engine_config, pEngine: [*c]ma_engine) ma_result;
pub extern fn ma_engine_uninit(pEngine: [*c]ma_engine) void;
pub extern fn ma_engine_data_callback(pEngine: [*c]ma_engine, pOutput: ?*c_void, pInput: ?*const c_void, frameCount: ma_uint32) void;
pub extern fn ma_engine_start(pEngine: [*c]ma_engine) ma_result;
pub extern fn ma_engine_stop(pEngine: [*c]ma_engine) ma_result;
pub extern fn ma_engine_set_volume(pEngine: [*c]ma_engine, volume: f32) ma_result;
pub extern fn ma_engine_set_gain_db(pEngine: [*c]ma_engine, gainDB: f32) ma_result;
pub extern fn ma_engine_get_master_sound_group(pEngine: [*c]ma_engine) [*c]ma_sound_group;
pub extern fn ma_engine_listener_set_position(pEngine: [*c]ma_engine, position: ma_vec3) ma_result;
pub extern fn ma_engine_listener_set_rotation(pEngine: [*c]ma_engine, rotation: ma_quat) ma_result;
pub extern fn ma_engine_play_sound(pEngine: [*c]ma_engine, pFilePath: [*c]const u8, pGroup: [*c]ma_sound_group) ma_result;
pub extern fn ma_sound_init_from_file(pEngine: [*c]ma_engine, pFilePath: [*c]const u8, flags: ma_uint32, pNotification: ?*ma_async_notification, pGroup: [*c]ma_sound_group, pSound: [*c]ma_sound) ma_result;
pub extern fn ma_sound_init_from_data_source(pEngine: [*c]ma_engine, pDataSource: ?*ma_data_source, flags: ma_uint32, pGroup: [*c]ma_sound_group, pSound: [*c]ma_sound) ma_result;
pub extern fn ma_sound_uninit(pSound: [*c]ma_sound) void;
pub extern fn ma_sound_start(pSound: [*c]ma_sound) ma_result;
pub extern fn ma_sound_stop(pSound: [*c]ma_sound) ma_result;
pub extern fn ma_sound_set_volume(pSound: [*c]ma_sound, volume: f32) ma_result;
pub extern fn ma_sound_set_gain_db(pSound: [*c]ma_sound, gainDB: f32) ma_result;
pub extern fn ma_sound_set_effect(pSound: [*c]ma_sound, pEffect: ?*ma_effect) ma_result;
pub extern fn ma_sound_set_pan(pSound: [*c]ma_sound, pan: f32) ma_result;
pub extern fn ma_sound_set_pitch(pSound: [*c]ma_sound, pitch: f32) ma_result;
pub extern fn ma_sound_set_position(pSound: [*c]ma_sound, position: ma_vec3) ma_result;
pub extern fn ma_sound_set_rotation(pSound: [*c]ma_sound, rotation: ma_quat) ma_result;
pub extern fn ma_sound_set_looping(pSound: [*c]ma_sound, isLooping: ma_bool32) ma_result;
pub extern fn ma_sound_set_fade_point_in_frames(pSound: [*c]ma_sound, fadePointIndex: ma_uint32, volumeBeg: f32, volumeEnd: f32, timeInFramesBeg: ma_uint64, timeInFramesEnd: ma_uint64) ma_result;
pub extern fn ma_sound_set_fade_point_in_milliseconds(pSound: [*c]ma_sound, fadePointIndex: ma_uint32, volumeBeg: f32, volumeEnd: f32, timeInMillisecondsBeg: ma_uint64, timeInMillisecondsEnd: ma_uint64) ma_result;
pub extern fn ma_sound_set_fade_point_auto_reset(pSound: [*c]ma_sound, fadePointIndex: ma_uint32, autoReset: ma_bool32) ma_result;
pub extern fn ma_sound_set_start_delay(pSound: [*c]ma_sound, delayInMilliseconds: ma_uint64) ma_result;
pub extern fn ma_sound_set_stop_delay(pSound: [*c]ma_sound, delayInMilliseconds: ma_uint64) ma_result;
pub extern fn ma_sound_is_playing(pSound: [*c]const ma_sound) ma_bool32;
pub extern fn ma_sound_at_end(pSound: [*c]const ma_sound) ma_bool32;
pub extern fn ma_sound_get_time_in_frames(pSound: [*c]const ma_sound, pTimeInFrames: [*c]ma_uint64) ma_result;
pub extern fn ma_sound_seek_to_pcm_frame(pSound: [*c]ma_sound, frameIndex: ma_uint64) ma_result;
pub extern fn ma_sound_get_data_format(pSound: [*c]ma_sound, pFormat: [*c]ma_format, pChannels: [*c]ma_uint32, pSampleRate: [*c]ma_uint32) ma_result;
pub extern fn ma_sound_get_cursor_in_pcm_frames(pSound: [*c]ma_sound, pCursor: [*c]ma_uint64) ma_result;
pub extern fn ma_sound_get_length_in_pcm_frames(pSound: [*c]ma_sound, pLength: [*c]ma_uint64) ma_result;
pub extern fn ma_sound_group_init(pEngine: [*c]ma_engine, pParentGroup: [*c]ma_sound_group, pGroup: [*c]ma_sound_group) ma_result;
pub extern fn ma_sound_group_uninit(pGroup: [*c]ma_sound_group) void;
pub extern fn ma_sound_group_start(pGroup: [*c]ma_sound_group) ma_result;
pub extern fn ma_sound_group_stop(pGroup: [*c]ma_sound_group) ma_result;
pub extern fn ma_sound_group_set_volume(pGroup: [*c]ma_sound_group, volume: f32) ma_result;
pub extern fn ma_sound_group_set_gain_db(pGroup: [*c]ma_sound_group, gainDB: f32) ma_result;
pub extern fn ma_sound_group_set_effect(pGroup: [*c]ma_sound_group, pEffect: ?*ma_effect) ma_result;
pub extern fn ma_sound_group_set_pan(pGroup: [*c]ma_sound_group, pan: f32) ma_result;
pub extern fn ma_sound_group_set_pitch(pGroup: [*c]ma_sound_group, pitch: f32) ma_result;
pub extern fn ma_sound_group_set_fade_point_in_frames(pGroup: [*c]ma_sound_group, fadePointIndex: ma_uint32, volumeBeg: f32, volumeEnd: f32, timeInFramesBeg: ma_uint64, timeInFramesEnd: ma_uint64) ma_result;
pub extern fn ma_sound_group_set_fade_point_in_milliseconds(pGroup: [*c]ma_sound_group, fadePointIndex: ma_uint32, volumeBeg: f32, volumeEnd: f32, timeInMillisecondsBeg: ma_uint64, timeInMillisecondsEnd: ma_uint64) ma_result;
pub extern fn ma_sound_group_set_fade_point_auto_reset(pGroup: [*c]ma_sound_group, fadePointIndex: ma_uint32, autoReset: ma_bool32) ma_result;
pub extern fn ma_sound_group_set_start_delay(pGroup: [*c]ma_sound_group, delayInMilliseconds: ma_uint64) ma_result;
pub extern fn ma_sound_group_set_stop_delay(pGroup: [*c]ma_sound_group, delayInMilliseconds: ma_uint64) ma_result;
pub extern fn ma_sound_group_is_playing(pGroup: [*c]const ma_sound_group) ma_bool32;
pub extern fn ma_sound_group_get_time_in_frames(pGroup: [*c]const ma_sound_group, pTimeInFrames: [*c]ma_uint64) ma_result;
pub const __INTMAX_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // (no file):64:9
pub const __UINTMAX_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_unsigned"); // (no file):68:9
pub const __PTRDIFF_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // (no file):75:9
pub const __INTPTR_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // (no file):79:9
pub const __SIZE_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_unsigned"); // (no file):83:9
pub const __UINTPTR_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_unsigned"); // (no file):98:9
pub const __INT64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):160:9
pub const __UINT64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):188:9
pub const __INT_LEAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):226:9
pub const __UINT_LEAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):230:9
pub const __INT_FAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):266:9
pub const __UINT_FAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):270:9
pub const MA_STRINGIFY = @compileError("unable to translate C expr: unexpected token .Hash"); // /Users/desaro/zig-miniaudio/miniaudio/extras/miniaudio_split/miniaudio.h:18:9
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token .HashHash"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:113:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token .Hash"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:114:9
pub const __const = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:116:9
pub const __volatile = @compileError("unable to translate C expr: unexpected token .Keyword_volatile"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:118:9
pub const __kpi_deprecated = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:202:9
pub const __restrict = @compileError("unable to translate C expr: unexpected token .Keyword_restrict"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:222:9
pub const __swift_unavailable = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:288:9
pub const __header_inline = @compileError("unable to translate C expr: unexpected token .Keyword_inline"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:322:10
pub const __IDSTRING = @compileError("unable to translate C expr: unexpected token .Keyword_static"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:379:9
pub const __FBSDID = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:399:9
pub const __DECONST = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:403:9
pub const __DEVOLATILE = @compileError("unable to translate C expr: unexpected token .Keyword_volatile"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:407:9
pub const __DEQUALIFY = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:411:9
pub const __alloc_size = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:429:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:35:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:41:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:47:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:53:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:59:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:65:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:71:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:77:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:83:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:89:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_5_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:95:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_5_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:101:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_6_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:107:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_6_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:113:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_7_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:119:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_7_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:125:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:131:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:137:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:143:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:149:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_4 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:155:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:161:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:167:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:173:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:179:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:185:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:191:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:197:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:203:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:209:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:215:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:221:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:227:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_4 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:233:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:239:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:245:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:251:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:257:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_4 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:263:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:269:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:275:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:281:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:287:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_4 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:293:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_5 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:299:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_6 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:305:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_10_15_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_symbol_aliasing.h:497:9
pub const __DARWIN_ALIAS_STARTING = @compileError("unable to translate C expr: unexpected token .HashHash"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:635:9
pub const __POSIX_C_DEPRECATED = @compileError("unable to translate C expr: unexpected token .HashHash"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:698:9
pub const __compiler_barrier = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:812:9
pub const __enum_decl = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:836:9
pub const __enum_closed_decl = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:838:9
pub const __options_decl = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:840:9
pub const __options_closed_decl = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/cdefs.h:842:9
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2919:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2920:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2921:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2923:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2927:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2929:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2934:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2938:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2939:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2941:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2945:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2947:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2951:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2953:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2958:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2962:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2963:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2965:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2969:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2971:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2975:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2977:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2982:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2987:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2991:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2993:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2997:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:2999:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3003:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3005:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3009:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3011:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3015:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3017:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3021:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3023:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3027:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3029:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3033:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3035:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3039:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3040:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3041:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3042:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3043:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3044:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3046:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3050:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3052:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3057:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3061:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3062:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3064:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3068:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3070:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3074:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3076:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3081:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3085:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3086:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3088:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3092:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3094:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3098:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3100:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3105:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3109:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3110:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3112:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3116:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3118:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3122:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3124:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3128:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3130:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3134:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3136:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3140:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3142:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3146:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3148:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3152:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3154:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3158:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3159:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3160:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3161:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3162:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3163:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3165:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3169:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3171:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3176:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3180:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3181:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3183:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3187:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3189:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3193:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3195:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3200:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3204:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3205:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3207:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3211:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3213:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3217:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3219:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3224:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3228:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3229:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3231:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3235:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3237:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3241:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3243:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3247:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3249:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3253:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3255:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3259:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3261:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3265:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3267:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3271:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3272:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3273:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3274:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3275:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3276:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3278:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3282:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3284:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3289:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3293:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3294:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3296:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3300:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3302:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3306:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3308:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3313:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3317:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3318:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3320:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3324:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3326:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3330:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3332:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3337:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3341:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3342:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3344:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3348:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3350:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3354:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3356:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3360:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3362:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3366:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3368:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3372:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3374:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3378:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3379:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3380:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEPRECATED__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3381:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3382:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3383:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3384:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3386:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3390:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3392:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3397:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3401:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3402:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3404:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3408:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3410:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3414:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3416:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3421:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3425:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3426:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3428:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3432:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3434:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3438:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3440:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3445:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3449:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3451:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3455:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3457:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3461:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3463:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3467:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3469:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3473:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3475:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3479:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3480:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3481:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3482:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3483:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3484:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3486:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3490:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3492:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3497:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3501:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3502:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3504:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3508:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3510:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3514:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3516:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3521:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3525:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3526:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3528:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3532:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3534:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3538:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3540:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3545:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3549:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3550:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3552:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3556:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3558:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3562:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3564:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3568:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3570:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3574:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3575:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3576:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3577:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3578:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3579:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3581:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3585:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3587:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3592:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3596:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3597:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3599:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3603:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3605:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3609:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3611:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3616:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3620:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3621:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3623:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3627:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3629:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3633:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3635:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3640:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_13_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3644:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3645:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3647:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3651:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3653:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3657:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3659:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3663:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3664:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3665:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3666:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3667:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3668:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3670:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3674:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3676:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3681:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3685:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3686:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3688:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3692:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3694:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3698:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3700:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3705:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3709:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3710:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3712:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3716:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3718:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3722:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3724:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3729:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3733:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3734:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3736:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3740:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3742:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3746:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3747:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3748:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3749:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3750:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3751:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3753:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3757:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3759:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3764:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3768:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3769:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3771:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3775:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3777:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3781:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3783:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3788:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3792:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3793:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3795:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3799:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3801:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3805:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3807:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3812:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3816:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_14 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3817:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3818:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3820:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3824:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3825:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3826:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_0 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3827:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_0_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3829:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3833:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3834:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3835:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3837:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3841:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3843:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3848:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3852:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3853:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3855:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3859:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3861:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3865:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3867:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3872:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3876:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3877:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3879:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3883:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3885:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3889:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3891:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3896:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3900:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3902:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3906:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3908:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3912:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3914:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3918:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3920:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_5 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3924:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_5_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3926:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_6 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3930:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_6_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3932:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_7 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3936:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_7_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3938:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_8 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3942:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_8_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3944:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_9 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3948:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_9_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3950:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_13_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3955:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3959:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3960:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3961:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3962:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3963:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3964:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3966:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3970:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3972:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3976:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3977:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3979:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3983:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3985:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3989:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3991:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:3996:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4000:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4001:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4003:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4007:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4009:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4013:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4015:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4020:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4024:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4025:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4026:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4027:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4029:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4033:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4034:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4036:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4040:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4042:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4046:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4048:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4053:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4057:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4058:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4060:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4064:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4066:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4070:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4072:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4077:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4081:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4082:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4083:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4084:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4085:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4087:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4091:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4093:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4098:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4102:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4103:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4105:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4109:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4111:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4115:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4117:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4122:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4126:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4127:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4129:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4133:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4135:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4139:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4141:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4146:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4150:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4152:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4156:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4157:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4158:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4159:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4160:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4161:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4163:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4167:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4169:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4173:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4175:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4179:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4180:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4182:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4186:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4188:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4192:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4194:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4199:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4203:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4204:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4205:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4206:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4208:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4212:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4214:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4218:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4219:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4221:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4225:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4227:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4231:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4233:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4238:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4242:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4243:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4244:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4245:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4247:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4251:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4252:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4254:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4258:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4260:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4264:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4266:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4271:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4275:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4276:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4277:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4278:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4279:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4281:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4285:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_3_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4287:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4291:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4293:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4298:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4302:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4303:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4305:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4309:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4311:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4315:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4317:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4322:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4326:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4327:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4328:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4329:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4330:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4332:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4336:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4338:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4342:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4344:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4348:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4349:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4350:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4351:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4353:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4357:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4359:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4363:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4364:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4365:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4366:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4368:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4372:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4373:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4374:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4375:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_1_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4377:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4381:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_2_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4383:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4387:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_4_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4389:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4394:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4398:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4400:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4404:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_14 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4405:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_NA = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4406:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_NA_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4407:21
pub const __AVAILABILITY_INTERNAL__MAC_10_13 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4408:21
pub const __AVAILABILITY_INTERNAL__MAC_10_13_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4409:21
pub const __AVAILABILITY_INTERNAL__MAC_10_14 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4410:21
pub const __AVAILABILITY_INTERNAL__MAC_10_14_DEP__MAC_10_14 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4411:21
pub const __AVAILABILITY_INTERNAL__MAC_10_15 = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4412:21
pub const __API_AVAILABLE_PLATFORM_macos = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4442:13
pub const __API_AVAILABLE_PLATFORM_macosx = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4443:13
pub const __API_AVAILABLE_PLATFORM_ios = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4444:13
pub const __API_AVAILABLE_PLATFORM_watchos = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4445:13
pub const __API_AVAILABLE_PLATFORM_tvos = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4446:13
pub const __API_AVAILABLE_PLATFORM_macCatalyst = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4448:13
pub const __API_AVAILABLE_PLATFORM_uikitformac = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4451:14
pub const __API_AVAILABLE_PLATFORM_driverkit = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4453:13
pub const __API_A = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4457:17
pub const __API_AVAILABLE_GET_MACRO = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4472:13
pub const __API_APPLY_TO = @compileError("unable to translate C expr: unexpected token .Keyword_enum"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4474:13
pub const __API_RANGE_STRINGIFY2 = @compileError("unable to translate C expr: unexpected token .Hash"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4476:13
pub const __API_A_BEGIN = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4478:13
pub const __API_AVAILABLE_BEGIN_GET_MACRO = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4487:13
pub const __API_DEPRECATED_PLATFORM_macos = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4490:13
pub const __API_DEPRECATED_PLATFORM_macosx = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4491:13
pub const __API_DEPRECATED_PLATFORM_ios = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4492:13
pub const __API_DEPRECATED_PLATFORM_watchos = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4493:13
pub const __API_DEPRECATED_PLATFORM_tvos = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4494:13
pub const __API_DEPRECATED_PLATFORM_macCatalyst = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4496:13
pub const __API_DEPRECATED_PLATFORM_uikitformac = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4499:14
pub const __API_DEPRECATED_PLATFORM_driverkit = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4501:13
pub const __API_D = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4505:17
pub const __API_DEPRECATED_MSG_GET_MACRO = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4520:13
pub const __API_D_BEGIN = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4522:13
pub const __API_DEPRECATED_BEGIN_MSG_GET_MACRO = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4531:13
pub const __API_R = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4534:17
pub const __API_DEPRECATED_REP_GET_MACRO = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4546:13
pub const __API_R_BEGIN = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4549:17
pub const __API_DEPRECATED_BEGIN_REP_GET_MACRO = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4561:13
pub const __API_U = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4586:17
pub const __API_UNAVAILABLE_GET_MACRO = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4601:13
pub const __API_U_BEGIN = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4603:13
pub const __API_UNAVAILABLE_BEGIN_GET_MACRO = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4612:13
pub const __swift_compiler_version_at_least = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4661:13
pub const __SPI_AVAILABLE = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/AvailabilityInternal.h:4669:11
pub const __OSX_AVAILABLE_STARTING = @compileError("unable to translate C expr: unexpected token .HashHash"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:295:17
pub const __OSX_AVAILABLE_BUT_DEPRECATED = @compileError("unable to translate C expr: unexpected token .HashHash"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:296:17
pub const __OSX_AVAILABLE_BUT_DEPRECATED_MSG = @compileError("unable to translate C expr: unexpected token .HashHash"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:298:17
pub const __OS_AVAILABILITY_MSG = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:322:13
pub const __OSX_AVAILABLE = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:358:13
pub const __OSX_DEPRECATED = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:359:13
pub const __IOS_AVAILABLE = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:381:13
pub const __IOS_DEPRECATED = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:382:13
pub const __TVOS_AVAILABLE = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:408:13
pub const __TVOS_DEPRECATED = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:409:13
pub const __WATCHOS_AVAILABLE = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:435:13
pub const __WATCHOS_DEPRECATED = @compileError("unable to translate C expr: expected ',' or ')'"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:436:13
pub const __API_AVAILABLE = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:504:13
pub const __API_AVAILABLE_BEGIN = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:506:13
pub const __API_DEPRECATED = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:525:13
pub const __API_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:526:13
pub const __API_DEPRECATED_BEGIN = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:528:13
pub const __API_DEPRECATED_WITH_REPLACEMENT_BEGIN = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:531:13
pub const __API_UNAVAILABLE = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:542:13
pub const __API_UNAVAILABLE_BEGIN = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:544:13
pub const __SPI_DEPRECATED = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:598:11
pub const __SPI_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/Availability.h:602:11
pub const _STRUCT_TIMESPEC = @compileError("unable to translate C expr: unexpected token .Keyword_struct"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types/_timespec.h:29:9
pub const __QOS_ENUM = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/qos.h:114:9
pub const __QOS_CLASS_AVAILABLE = @compileError("unable to translate C expr: expected identifier"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/qos.h:115:9
pub const pthread_cleanup_push = @compileError("unable to translate C expr: unexpected token .LBrace"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/pthread.h:119:9
pub const pthread_cleanup_pop = @compileError("unable to translate C expr: unexpected token .Equal"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/pthread.h:128:9
pub const PTHREAD_RWLOCK_INITIALIZER = @compileError("unable to translate C expr: unexpected token .LBrace"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/pthread.h:183:9
pub const PTHREAD_MUTEX_INITIALIZER = @compileError("unable to translate C expr: unexpected token .LBrace"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/pthread.h:188:9
pub const PTHREAD_ERRORCHECK_MUTEX_INITIALIZER = @compileError("unable to translate C expr: unexpected token .LBrace"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/pthread.h:193:11
pub const PTHREAD_RECURSIVE_MUTEX_INITIALIZER = @compileError("unable to translate C expr: unexpected token .LBrace"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/pthread.h:194:11
pub const PTHREAD_COND_INITIALIZER = @compileError("unable to translate C expr: unexpected token .LBrace"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/pthread.h:210:9
pub const PTHREAD_ONCE_INIT = @compileError("unable to translate C expr: unexpected token .LBrace"); // /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/pthread.h:216:9
pub const MA_INLINE = @compileError("unable to translate C expr: unexpected token .Keyword_inline"); // /Users/desaro/zig-miniaudio/miniaudio/extras/miniaudio_split/miniaudio.h:141:17
pub const MA_API = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // /Users/desaro/zig-miniaudio/miniaudio/extras/miniaudio_split/miniaudio.h:172:17
pub const MA_PRIVATE = @compileError("unable to translate C expr: unexpected token .Keyword_static"); // /Users/desaro/zig-miniaudio/miniaudio/extras/miniaudio_split/miniaudio.h:173:17
pub const __llvm__ = 1;
pub const __clang__ = 1;
pub const __clang_major__ = 10;
pub const __clang_minor__ = 0;
pub const __clang_patchlevel__ = 1;
pub const __clang_version__ = "10.0.1 ";
pub const __GNUC__ = 4;
pub const __GNUC_MINOR__ = 2;
pub const __GNUC_PATCHLEVEL__ = 1;
pub const __GXX_ABI_VERSION = 1002;
pub const __ATOMIC_RELAXED = 0;
pub const __ATOMIC_CONSUME = 1;
pub const __ATOMIC_ACQUIRE = 2;
pub const __ATOMIC_RELEASE = 3;
pub const __ATOMIC_ACQ_REL = 4;
pub const __ATOMIC_SEQ_CST = 5;
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = 0;
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = 1;
pub const __OPENCL_MEMORY_SCOPE_DEVICE = 2;
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = 3;
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = 4;
pub const __PRAGMA_REDEFINE_EXTNAME = 1;
pub const __VERSION__ = "Clang 10.0.1 ";
pub const __OBJC_BOOL_IS_BOOL = 0;
pub const __CONSTANT_CFSTRINGS__ = 1;
pub const __block = __attribute__(__blocks__(byref));
pub const __BLOCKS__ = 1;
pub const __OPTIMIZE__ = 1;
pub const __ORDER_LITTLE_ENDIAN__ = 1234;
pub const __ORDER_BIG_ENDIAN__ = 4321;
pub const __ORDER_PDP_ENDIAN__ = 3412;
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = 1;
pub const _LP64 = 1;
pub const __LP64__ = 1;
pub const __CHAR_BIT__ = 8;
pub const __SCHAR_MAX__ = 127;
pub const __SHRT_MAX__ = 32767;
pub const __INT_MAX__ = 2147483647;
pub const __LONG_MAX__ = @as(c_long, 9223372036854775807);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = 2147483647;
pub const __WINT_MAX__ = 2147483647;
pub const __INTMAX_MAX__ = @as(c_long, 9223372036854775807);
pub const __SIZE_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __UINTMAX_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __PTRDIFF_MAX__ = @as(c_long, 9223372036854775807);
pub const __INTPTR_MAX__ = @as(c_long, 9223372036854775807);
pub const __UINTPTR_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __SIZEOF_DOUBLE__ = 8;
pub const __SIZEOF_FLOAT__ = 4;
pub const __SIZEOF_INT__ = 4;
pub const __SIZEOF_LONG__ = 8;
pub const __SIZEOF_LONG_DOUBLE__ = 16;
pub const __SIZEOF_LONG_LONG__ = 8;
pub const __SIZEOF_POINTER__ = 8;
pub const __SIZEOF_SHORT__ = 2;
pub const __SIZEOF_PTRDIFF_T__ = 8;
pub const __SIZEOF_SIZE_T__ = 8;
pub const __SIZEOF_WCHAR_T__ = 4;
pub const __SIZEOF_WINT_T__ = 4;
pub const __SIZEOF_INT128__ = 16;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __INTMAX_C_SUFFIX__ = L;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __UINTMAX_C_SUFFIX__ = UL;
pub const __INTMAX_WIDTH__ = 64;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __PTRDIFF_WIDTH__ = 64;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __INTPTR_WIDTH__ = 64;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __SIZE_WIDTH__ = 64;
pub const __WCHAR_TYPE__ = c_int;
pub const __WCHAR_WIDTH__ = 32;
pub const __WINT_TYPE__ = c_int;
pub const __WINT_WIDTH__ = 32;
pub const __SIG_ATOMIC_WIDTH__ = 32;
pub const __SIG_ATOMIC_MAX__ = 2147483647;
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTMAX_WIDTH__ = 64;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __UINTPTR_WIDTH__ = 64;
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = 1;
pub const __FLT_DIG__ = 6;
pub const __FLT_DECIMAL_DIG__ = 9;
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = 1;
pub const __FLT_HAS_QUIET_NAN__ = 1;
pub const __FLT_MANT_DIG__ = 24;
pub const __FLT_MAX_10_EXP__ = 38;
pub const __FLT_MAX_EXP__ = 128;
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -37;
pub const __FLT_MIN_EXP__ = -125;
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = 4.9406564584124654e-324;
pub const __DBL_HAS_DENORM__ = 1;
pub const __DBL_DIG__ = 15;
pub const __DBL_DECIMAL_DIG__ = 17;
pub const __DBL_EPSILON__ = 2.2204460492503131e-16;
pub const __DBL_HAS_INFINITY__ = 1;
pub const __DBL_HAS_QUIET_NAN__ = 1;
pub const __DBL_MANT_DIG__ = 53;
pub const __DBL_MAX_10_EXP__ = 308;
pub const __DBL_MAX_EXP__ = 1024;
pub const __DBL_MAX__ = 1.7976931348623157e+308;
pub const __DBL_MIN_10_EXP__ = -307;
pub const __DBL_MIN_EXP__ = -1021;
pub const __DBL_MIN__ = 2.2250738585072014e-308;
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = 1;
pub const __LDBL_DIG__ = 18;
pub const __LDBL_DECIMAL_DIG__ = 21;
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = 1;
pub const __LDBL_HAS_QUIET_NAN__ = 1;
pub const __LDBL_MANT_DIG__ = 64;
pub const __LDBL_MAX_10_EXP__ = 4932;
pub const __LDBL_MAX_EXP__ = 16384;
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -4931;
pub const __LDBL_MIN_EXP__ = -16381;
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __POINTER_WIDTH__ = 64;
pub const __BIGGEST_ALIGNMENT__ = 16;
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT64_FMTd__ = "lld";
pub const __INT64_FMTi__ = "lli";
pub const __INT64_C_SUFFIX__ = LL;
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_MAX__ = 255;
pub const __INT8_MAX__ = 127;
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_MAX__ = 65535;
pub const __INT16_MAX__ = 32767;
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = U;
pub const __UINT32_MAX__ = @as(c_uint, 4294967295);
pub const __INT32_MAX__ = 2147483647;
pub const __UINT64_FMTo__ = "llo";
pub const __UINT64_FMTu__ = "llu";
pub const __UINT64_FMTx__ = "llx";
pub const __UINT64_FMTX__ = "llX";
pub const __UINT64_C_SUFFIX__ = ULL;
pub const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = 127;
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = 255;
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = 32767;
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = 65535;
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = 2147483647;
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @as(c_uint, 4294967295);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST64_FMTd__ = "lld";
pub const __INT_LEAST64_FMTi__ = "lli";
pub const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_LEAST64_FMTo__ = "llo";
pub const __UINT_LEAST64_FMTu__ = "llu";
pub const __UINT_LEAST64_FMTx__ = "llx";
pub const __UINT_LEAST64_FMTX__ = "llX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = 127;
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = 255;
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = 32767;
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = 65535;
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = 2147483647;
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @as(c_uint, 4294967295);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_FAST64_FMTd__ = "lld";
pub const __INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_FAST64_FMTo__ = "llo";
pub const __UINT_FAST64_FMTu__ = "llu";
pub const __UINT_FAST64_FMTx__ = "llx";
pub const __UINT_FAST64_FMTX__ = "llX";
pub const __USER_LABEL_PREFIX__ = _;
pub const __FINITE_MATH_ONLY__ = 0;
pub const __GNUC_STDC_INLINE__ = 1;
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = 1;
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_INT_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = 2;
pub const __GCC_ATOMIC_INT_LOCK_FREE = 2;
pub const __GCC_ATOMIC_LONG_LOCK_FREE = 2;
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __PIC__ = 2;
pub const __pic__ = 2;
pub const __FLT_EVAL_METHOD__ = 0;
pub const __FLT_RADIX__ = 2;
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = 2;
pub const __nonnull = _Nonnull;
pub const __null_unspecified = _Null_unspecified;
pub const __nullable = _Nullable;
pub const __GCC_ASM_FLAG_OUTPUTS__ = 1;
pub const __code_model_small_ = 1;
pub const __amd64__ = 1;
pub const __amd64 = 1;
pub const __x86_64 = 1;
pub const __x86_64__ = 1;
pub const __SEG_GS = 1;
pub const __SEG_FS = 1;
pub const __seg_gs = __attribute__(address_space(256));
pub const __seg_fs = __attribute__(address_space(257));
pub const __corei7 = 1;
pub const __corei7__ = 1;
pub const __tune_corei7__ = 1;
pub const __NO_MATH_INLINES = 1;
pub const __AES__ = 1;
pub const __PCLMUL__ = 1;
pub const __LZCNT__ = 1;
pub const __RDRND__ = 1;
pub const __FSGSBASE__ = 1;
pub const __BMI__ = 1;
pub const __BMI2__ = 1;
pub const __POPCNT__ = 1;
pub const __PRFCHW__ = 1;
pub const __RDSEED__ = 1;
pub const __ADX__ = 1;
pub const __MOVBE__ = 1;
pub const __FMA__ = 1;
pub const __F16C__ = 1;
pub const __FXSR__ = 1;
pub const __XSAVE__ = 1;
pub const __XSAVEOPT__ = 1;
pub const __XSAVEC__ = 1;
pub const __XSAVES__ = 1;
pub const __CLFLUSHOPT__ = 1;
pub const __SGX__ = 1;
pub const __INVPCID__ = 1;
pub const __AVX2__ = 1;
pub const __AVX__ = 1;
pub const __SSE4_2__ = 1;
pub const __SSE4_1__ = 1;
pub const __SSSE3__ = 1;
pub const __SSE3__ = 1;
pub const __SSE2__ = 1;
pub const __SSE2_MATH__ = 1;
pub const __SSE__ = 1;
pub const __SSE_MATH__ = 1;
pub const __MMX__ = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = 1;
pub const __APPLE_CC__ = 6000;
pub const __APPLE__ = 1;
pub const __STDC_NO_THREADS__ = 1;
pub const OBJC_NEW_PROPERTIES = 1;
pub const __weak = __attribute__(objc_gc(weak));
pub const __DYNAMIC__ = 1;
pub const __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ = 101500;
pub const __MACH__ = 1;
pub const __STDC__ = 1;
pub const __STDC_HOSTED__ = 1;
pub const __STDC_VERSION__ = @as(c_long, 201112);
pub const __STDC_UTF_16__ = 1;
pub const __STDC_UTF_32__ = 1;
pub const _DEBUG = 1;
pub inline fn MA_XSTRINGIFY(x: anytype) @TypeOf(MA_STRINGIFY(x)) {
    return MA_STRINGIFY(x);
}
pub const MA_VERSION_MAJOR = 0;
pub const MA_VERSION_MINOR = 10;
pub const MA_VERSION_REVISION = 17;
pub const MA_VERSION_STRING = MA_XSTRINGIFY(MA_VERSION_MAJOR) ++ ("." ++ (MA_XSTRINGIFY(MA_VERSION_MINOR) ++ ("." ++ MA_XSTRINGIFY(MA_VERSION_REVISION))));
pub inline fn __P(protos: anytype) @TypeOf(protos) {
    return protos;
}
pub const __signed = c_int;
pub const __dead2 = __attribute__(__noreturn__);
pub const __pure2 = __attribute__(__const__);
pub const __unused = __attribute__(__unused__);
pub const __used = __attribute__(__used__);
pub const __cold = __attribute__(__cold__);
pub const __deprecated = __attribute__(__deprecated__);
pub inline fn __deprecated_msg(_msg: anytype) @TypeOf(__attribute__(__deprecated__(_msg))) {
    return __attribute__(__deprecated__(_msg));
}
pub inline fn __deprecated_enum_msg(_msg: anytype) @TypeOf(__deprecated_msg(_msg)) {
    return __deprecated_msg(_msg);
}
pub const __unavailable = __attribute__(__unavailable__);
pub const __disable_tail_calls = __attribute__(__disable_tail_calls__);
pub const __not_tail_called = __attribute__(__not_tail_called__);
pub const __result_use_check = __attribute__(__warn_unused_result__);
pub const __abortlike = __dead2 ++ (__cold ++ __not_tail_called);
pub const __header_always_inline = __header_inline ++ __attribute__(__always_inline__);
pub const __unreachable_ok_push = _Pragma("clang diagnostic push") ++ _Pragma("clang diagnostic ignored \"-Wunreachable-code\"");
pub const __unreachable_ok_pop = _Pragma("clang diagnostic pop");
pub inline fn __printflike(fmtarg: anytype, firstvararg: anytype) @TypeOf(__attribute__(__format__(__printf__, fmtarg, firstvararg))) {
    return __attribute__(__format__(__printf__, fmtarg, firstvararg));
}
pub inline fn __printf0like(fmtarg: anytype, firstvararg: anytype) @TypeOf(__attribute__(__format__(__printf0__, fmtarg, firstvararg))) {
    return __attribute__(__format__(__printf0__, fmtarg, firstvararg));
}
pub inline fn __scanflike(fmtarg: anytype, firstvararg: anytype) @TypeOf(__attribute__(__format__(__scanf__, fmtarg, firstvararg))) {
    return __attribute__(__format__(__scanf__, fmtarg, firstvararg));
}
pub inline fn __COPYRIGHT(s: anytype) @TypeOf(__IDSTRING(copyright, s)) {
    return __IDSTRING(copyright, s);
}
pub inline fn __RCSID(s: anytype) @TypeOf(__IDSTRING(rcsid, s)) {
    return __IDSTRING(rcsid, s);
}
pub inline fn __SCCSID(s: anytype) @TypeOf(__IDSTRING(sccsid, s)) {
    return __IDSTRING(sccsid, s);
}
pub inline fn __PROJECT_VERSION(s: anytype) @TypeOf(__IDSTRING(project_version, s)) {
    return __IDSTRING(project_version, s);
}
pub const __DARWIN_ONLY_64_BIT_INO_T = 0;
pub const __DARWIN_ONLY_VERS_1050 = 0;
pub const __DARWIN_ONLY_UNIX_CONFORMANCE = 1;
pub const __DARWIN_UNIX03 = 1;
pub const __DARWIN_64_BIT_INO_T = 1;
pub const __DARWIN_VERS_1050 = 1;
pub const __DARWIN_NON_CANCELABLE = 0;
pub const __DARWIN_SUF_64_BIT_INO_T = "$INODE64";
pub const __DARWIN_SUF_1050 = "$1050";
pub const __DARWIN_SUF_EXTSN = "$DARWIN_EXTSN";
pub inline fn __DARWIN_ALIAS(sym: anytype) @TypeOf(__asm("_" ++ (__STRING(sym) ++ __DARWIN_SUF_UNIX03))) {
    return __asm("_" ++ (__STRING(sym) ++ __DARWIN_SUF_UNIX03));
}
pub inline fn __DARWIN_ALIAS_C(sym: anytype) @TypeOf(__asm("_" ++ (__STRING(sym) ++ (__DARWIN_SUF_NON_CANCELABLE ++ __DARWIN_SUF_UNIX03)))) {
    return __asm("_" ++ (__STRING(sym) ++ (__DARWIN_SUF_NON_CANCELABLE ++ __DARWIN_SUF_UNIX03)));
}
pub inline fn __DARWIN_ALIAS_I(sym: anytype) @TypeOf(__asm("_" ++ (__STRING(sym) ++ (__DARWIN_SUF_64_BIT_INO_T ++ __DARWIN_SUF_UNIX03)))) {
    return __asm("_" ++ (__STRING(sym) ++ (__DARWIN_SUF_64_BIT_INO_T ++ __DARWIN_SUF_UNIX03)));
}
pub inline fn __DARWIN_NOCANCEL(sym: anytype) @TypeOf(__asm("_" ++ (__STRING(sym) ++ __DARWIN_SUF_NON_CANCELABLE))) {
    return __asm("_" ++ (__STRING(sym) ++ __DARWIN_SUF_NON_CANCELABLE));
}
pub inline fn __DARWIN_INODE64(sym: anytype) @TypeOf(__asm("_" ++ (__STRING(sym) ++ __DARWIN_SUF_64_BIT_INO_T))) {
    return __asm("_" ++ (__STRING(sym) ++ __DARWIN_SUF_64_BIT_INO_T));
}
pub inline fn __DARWIN_1050(sym: anytype) @TypeOf(__asm("_" ++ (__STRING(sym) ++ __DARWIN_SUF_1050))) {
    return __asm("_" ++ (__STRING(sym) ++ __DARWIN_SUF_1050));
}
pub inline fn __DARWIN_1050ALIAS(sym: anytype) @TypeOf(__asm("_" ++ (__STRING(sym) ++ (__DARWIN_SUF_1050 ++ __DARWIN_SUF_UNIX03)))) {
    return __asm("_" ++ (__STRING(sym) ++ (__DARWIN_SUF_1050 ++ __DARWIN_SUF_UNIX03)));
}
pub inline fn __DARWIN_1050ALIAS_C(sym: anytype) @TypeOf(__asm("_" ++ (__STRING(sym) ++ (__DARWIN_SUF_1050 ++ (__DARWIN_SUF_NON_CANCELABLE ++ __DARWIN_SUF_UNIX03))))) {
    return __asm("_" ++ (__STRING(sym) ++ (__DARWIN_SUF_1050 ++ (__DARWIN_SUF_NON_CANCELABLE ++ __DARWIN_SUF_UNIX03))));
}
pub inline fn __DARWIN_1050ALIAS_I(sym: anytype) @TypeOf(__asm("_" ++ (__STRING(sym) ++ (__DARWIN_SUF_1050 ++ (__DARWIN_SUF_64_BIT_INO_T ++ __DARWIN_SUF_UNIX03))))) {
    return __asm("_" ++ (__STRING(sym) ++ (__DARWIN_SUF_1050 ++ (__DARWIN_SUF_64_BIT_INO_T ++ __DARWIN_SUF_UNIX03))));
}
pub inline fn __DARWIN_1050INODE64(sym: anytype) @TypeOf(__asm("_" ++ (__STRING(sym) ++ (__DARWIN_SUF_1050 ++ __DARWIN_SUF_64_BIT_INO_T)))) {
    return __asm("_" ++ (__STRING(sym) ++ (__DARWIN_SUF_1050 ++ __DARWIN_SUF_64_BIT_INO_T)));
}
pub inline fn __DARWIN_EXTSN(sym: anytype) @TypeOf(__asm("_" ++ (__STRING(sym) ++ __DARWIN_SUF_EXTSN))) {
    return __asm("_" ++ (__STRING(sym) ++ __DARWIN_SUF_EXTSN));
}
pub inline fn __DARWIN_EXTSN_C(sym: anytype) @TypeOf(__asm("_" ++ (__STRING(sym) ++ (__DARWIN_SUF_EXTSN ++ __DARWIN_SUF_NON_CANCELABLE)))) {
    return __asm("_" ++ (__STRING(sym) ++ (__DARWIN_SUF_EXTSN ++ __DARWIN_SUF_NON_CANCELABLE)));
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_0(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_1(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_3(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_5(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_6(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_7(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_8(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_9(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10_3(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_3(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_1(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_1(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_2(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_1(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_4(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_5(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_6(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_15(x: anytype) @TypeOf(x) {
    return x;
}
pub const __DARWIN_C_ANSI = @as(c_long, 0o010000);
pub const __DARWIN_C_FULL = @as(c_long, 900000);
pub const __DARWIN_C_LEVEL = __DARWIN_C_FULL;
pub const __STDC_WANT_LIB_EXT1__ = 1;
pub const __DARWIN_NO_LONG_LONG = 0;
pub const _DARWIN_FEATURE_64_BIT_INODE = 1;
pub const _DARWIN_FEATURE_ONLY_UNIX_CONFORMANCE = 1;
pub const _DARWIN_FEATURE_UNIX_CONFORMANCE = 3;
pub inline fn __CAST_AWAY_QUALIFIER(variable: anytype, qualifier: anytype, type_1: anytype) @TypeOf((@import("std").meta.cast(type_1, c_long))(variable)) {
    return (@import("std").meta.cast(type_1, c_long))(variable);
}
pub const __XNU_PRIVATE_EXTERN = __attribute__(visibility("hidden"));
pub const __enum_open = __attribute__(__enum_extensibility__(open));
pub const __enum_closed = __attribute__(__enum_extensibility__(closed));
pub const __enum_options = __attribute__(__flag_enum__);
pub const __DARWIN_NULL = (@import("std").meta.cast(?*c_void, 0));
pub const __PTHREAD_SIZE__ = 8176;
pub const __PTHREAD_ATTR_SIZE__ = 56;
pub const __PTHREAD_MUTEXATTR_SIZE__ = 8;
pub const __PTHREAD_MUTEX_SIZE__ = 56;
pub const __PTHREAD_CONDATTR_SIZE__ = 8;
pub const __PTHREAD_COND_SIZE__ = 40;
pub const __PTHREAD_ONCE_SIZE__ = 8;
pub const __PTHREAD_RWLOCK_SIZE__ = 192;
pub const __PTHREAD_RWLOCKATTR_SIZE__ = 16;
pub inline fn __offsetof(type_1: anytype, field: anytype) @TypeOf(__builtin_offsetof(type_1, field)) {
    return __builtin_offsetof(type_1, field);
}
pub inline fn __strfmonlike(fmtarg: anytype, firstvararg: anytype) @TypeOf(__attribute__(__format__(__strfmon__, fmtarg, firstvararg))) {
    return __attribute__(__format__(__strfmon__, fmtarg, firstvararg));
}
pub inline fn __strftimelike(fmtarg: anytype) @TypeOf(__attribute__(__format__(__strftime__, fmtarg, 0))) {
    return __attribute__(__format__(__strftime__, fmtarg, 0));
}
pub const __DARWIN_WCHAR_MAX = __WCHAR_MAX__;
pub const __DARWIN_WCHAR_MIN = -0x7fffffff - 1;
pub const __DARWIN_WEOF = __darwin_wint_t - 1;
pub const _FORTIFY_SOURCE = 2;
pub const _PTHREAD_MUTEX_SIG_init = 0x32AAABA7;
pub const _PTHREAD_ERRORCHECK_MUTEX_SIG_init = 0x32AAABA1;
pub const _PTHREAD_RECURSIVE_MUTEX_SIG_init = 0x32AAABA2;
pub const _PTHREAD_FIRSTFIT_MUTEX_SIG_init = 0x32AAABA3;
pub const _PTHREAD_COND_SIG_init = 0x3CB0B1BB;
pub const _PTHREAD_ONCE_SIG_init = 0x30B1BCBA;
pub const _PTHREAD_RWLOCK_SIG_init = 0x2DA8B3B4;
pub const SCHED_OTHER = 1;
pub const SCHED_FIFO = 4;
pub const SCHED_RR = 2;
pub const __SCHED_PARAM_SIZE__ = 4;
pub const __API_TO_BE_DEPRECATED = 100000;
pub const __MAC_10_0 = 1000;
pub const __MAC_10_1 = 1010;
pub const __MAC_10_2 = 1020;
pub const __MAC_10_3 = 1030;
pub const __MAC_10_4 = 1040;
pub const __MAC_10_5 = 1050;
pub const __MAC_10_6 = 1060;
pub const __MAC_10_7 = 1070;
pub const __MAC_10_8 = 1080;
pub const __MAC_10_9 = 1090;
pub const __MAC_10_10 = 101000;
pub const __MAC_10_10_2 = 101002;
pub const __MAC_10_10_3 = 101003;
pub const __MAC_10_11 = 101100;
pub const __MAC_10_11_2 = 101102;
pub const __MAC_10_11_3 = 101103;
pub const __MAC_10_11_4 = 101104;
pub const __MAC_10_12 = 101200;
pub const __MAC_10_12_1 = 101201;
pub const __MAC_10_12_2 = 101202;
pub const __MAC_10_12_4 = 101204;
pub const __MAC_10_13 = 101300;
pub const __MAC_10_13_1 = 101301;
pub const __MAC_10_13_2 = 101302;
pub const __MAC_10_13_4 = 101304;
pub const __MAC_10_14 = 101400;
pub const __MAC_10_14_1 = 101401;
pub const __MAC_10_14_4 = 101404;
pub const __MAC_10_15 = 101500;
pub const __MAC_10_15_1 = 101501;
pub const __MAC_10_15_4 = 101504;
pub const __IPHONE_2_0 = 20000;
pub const __IPHONE_2_1 = 20100;
pub const __IPHONE_2_2 = 20200;
pub const __IPHONE_3_0 = 30000;
pub const __IPHONE_3_1 = 30100;
pub const __IPHONE_3_2 = 30200;
pub const __IPHONE_4_0 = 40000;
pub const __IPHONE_4_1 = 40100;
pub const __IPHONE_4_2 = 40200;
pub const __IPHONE_4_3 = 40300;
pub const __IPHONE_5_0 = 50000;
pub const __IPHONE_5_1 = 50100;
pub const __IPHONE_6_0 = 60000;
pub const __IPHONE_6_1 = 60100;
pub const __IPHONE_7_0 = 70000;
pub const __IPHONE_7_1 = 70100;
pub const __IPHONE_8_0 = 80000;
pub const __IPHONE_8_1 = 80100;
pub const __IPHONE_8_2 = 80200;
pub const __IPHONE_8_3 = 80300;
pub const __IPHONE_8_4 = 80400;
pub const __IPHONE_9_0 = 90000;
pub const __IPHONE_9_1 = 90100;
pub const __IPHONE_9_2 = 90200;
pub const __IPHONE_9_3 = 90300;
pub const __IPHONE_10_0 = 100000;
pub const __IPHONE_10_1 = 100100;
pub const __IPHONE_10_2 = 100200;
pub const __IPHONE_10_3 = 100300;
pub const __IPHONE_11_0 = 110000;
pub const __IPHONE_11_1 = 110100;
pub const __IPHONE_11_2 = 110200;
pub const __IPHONE_11_3 = 110300;
pub const __IPHONE_11_4 = 110400;
pub const __IPHONE_12_0 = 120000;
pub const __IPHONE_12_1 = 120100;
pub const __IPHONE_12_2 = 120200;
pub const __IPHONE_12_3 = 120300;
pub const __IPHONE_13_0 = 130000;
pub const __IPHONE_13_1 = 130100;
pub const __IPHONE_13_2 = 130200;
pub const __IPHONE_13_3 = 130300;
pub const __IPHONE_13_4 = 130400;
pub const __IPHONE_13_5 = 130500;
pub const __IPHONE_13_6 = 130600;
pub const __TVOS_9_0 = 90000;
pub const __TVOS_9_1 = 90100;
pub const __TVOS_9_2 = 90200;
pub const __TVOS_10_0 = 100000;
pub const __TVOS_10_0_1 = 100001;
pub const __TVOS_10_1 = 100100;
pub const __TVOS_10_2 = 100200;
pub const __TVOS_11_0 = 110000;
pub const __TVOS_11_1 = 110100;
pub const __TVOS_11_2 = 110200;
pub const __TVOS_11_3 = 110300;
pub const __TVOS_11_4 = 110400;
pub const __TVOS_12_0 = 120000;
pub const __TVOS_12_1 = 120100;
pub const __TVOS_12_2 = 120200;
pub const __TVOS_12_3 = 120300;
pub const __TVOS_13_0 = 130000;
pub const __TVOS_13_2 = 130200;
pub const __TVOS_13_3 = 130300;
pub const __TVOS_13_4 = 130400;
pub const __WATCHOS_1_0 = 10000;
pub const __WATCHOS_2_0 = 20000;
pub const __WATCHOS_2_1 = 20100;
pub const __WATCHOS_2_2 = 20200;
pub const __WATCHOS_3_0 = 30000;
pub const __WATCHOS_3_1 = 30100;
pub const __WATCHOS_3_1_1 = 30101;
pub const __WATCHOS_3_2 = 30200;
pub const __WATCHOS_4_0 = 40000;
pub const __WATCHOS_4_1 = 40100;
pub const __WATCHOS_4_2 = 40200;
pub const __WATCHOS_4_3 = 40300;
pub const __WATCHOS_5_0 = 50000;
pub const __WATCHOS_5_1 = 50100;
pub const __WATCHOS_5_2 = 50200;
pub const __WATCHOS_6_0 = 60000;
pub const __WATCHOS_6_1 = 60100;
pub const __WATCHOS_6_2 = 60200;
pub const __DRIVERKIT_19_0 = 190000;
pub const __MAC_OS_X_VERSION_MIN_REQUIRED = __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__;
pub const __MAC_OS_X_VERSION_MAX_ALLOWED = __MAC_10_15;
pub const __AVAILABILITY_INTERNAL_DEPRECATED = __attribute__(deprecated);
pub inline fn __AVAILABILITY_INTERNAL_DEPRECATED_MSG(_msg: anytype) @TypeOf(__attribute__(deprecated(_msg))) {
    return __attribute__(deprecated(_msg));
}
pub const __AVAILABILITY_INTERNAL_UNAVAILABLE = __attribute__(unavailable);
pub const __AVAILABILITY_INTERNAL_WEAK_IMPORT = __attribute__(weak_import);
pub const __ENABLE_LEGACY_MAC_AVAILABILITY = 1;
pub const __AVAILABILITY_INTERNAL__MAC_NA = __attribute__(availability(macosx, unavailable));
pub const __AVAILABILITY_INTERNAL__MAC_NA_DEP__MAC_NA = __attribute__(availability(macosx, unavailable));
pub inline fn __AVAILABILITY_INTERNAL__MAC_NA_DEP__MAC_NA_MSG(_msg: anytype) @TypeOf(__attribute__(availability(macosx, unavailable))) {
    return __attribute__(availability(macosx, unavailable));
}
pub const __AVAILABILITY_INTERNAL__IPHONE_NA = __attribute__(availability(ios, unavailable));
pub const __AVAILABILITY_INTERNAL__IPHONE_NA__IPHONE_NA = __attribute__(availability(ios, unavailable));
pub const __AVAILABILITY_INTERNAL__IPHONE_NA_DEP__IPHONE_NA = __attribute__(availability(ios, unavailable));
pub inline fn __AVAILABILITY_INTERNAL__IPHONE_NA_DEP__IPHONE_NA_MSG(_msg: anytype) @TypeOf(__attribute__(availability(ios, unavailable))) {
    return __attribute__(availability(ios, unavailable));
}
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION = __attribute__(availability(ios, unavailable));
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION_DEP__IPHONE_COMPAT_VERSION = __attribute__(availability(ios, unavailable));
pub inline fn __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION_DEP__IPHONE_COMPAT_VERSION_MSG(_msg: anytype) @TypeOf(__attribute__(availability(ios, unavailable))) {
    return __attribute__(availability(ios, unavailable));
}
pub inline fn __API_AVAILABLE1(x: anytype) @TypeOf(__API_A(x)) {
    return __API_A(x);
}
pub inline fn __API_AVAILABLE2(x: anytype, y: anytype) @TypeOf(__API_A(x) ++ __API_A(y)) {
    return __API_A(x) ++ __API_A(y);
}
pub inline fn __API_AVAILABLE3(x: anytype, y: anytype, z: anytype) @TypeOf(__API_A(x) ++ (__API_A(y) ++ __API_A(z))) {
    return __API_A(x) ++ (__API_A(y) ++ __API_A(z));
}
pub inline fn __API_AVAILABLE4(x: anytype, y: anytype, z: anytype, t: anytype) @TypeOf(__API_A(x) ++ (__API_A(y) ++ (__API_A(z) ++ __API_A(t)))) {
    return __API_A(x) ++ (__API_A(y) ++ (__API_A(z) ++ __API_A(t)));
}
pub inline fn __API_AVAILABLE5(x: anytype, y: anytype, z: anytype, t: anytype, b: anytype) @TypeOf(__API_A(x) ++ (__API_A(y) ++ (__API_A(z) ++ (__API_A(t) ++ __API_A(b))))) {
    return __API_A(x) ++ (__API_A(y) ++ (__API_A(z) ++ (__API_A(t) ++ __API_A(b))));
}
pub inline fn __API_AVAILABLE6(x: anytype, y: anytype, z: anytype, t: anytype, b: anytype, m: anytype) @TypeOf(__API_A(x) ++ (__API_A(y) ++ (__API_A(z) ++ (__API_A(t) ++ (__API_A(b) ++ __API_A(m)))))) {
    return __API_A(x) ++ (__API_A(y) ++ (__API_A(z) ++ (__API_A(t) ++ (__API_A(b) ++ __API_A(m)))));
}
pub inline fn __API_AVAILABLE7(x: anytype, y: anytype, z: anytype, t: anytype, b: anytype, m: anytype, d: anytype) @TypeOf(__API_A(x) ++ (__API_A(y) ++ (__API_A(z) ++ (__API_A(t) ++ (__API_A(b) ++ (__API_A(m) ++ __API_A(d))))))) {
    return __API_A(x) ++ (__API_A(y) ++ (__API_A(z) ++ (__API_A(t) ++ (__API_A(b) ++ (__API_A(m) ++ __API_A(d))))));
}
pub inline fn __API_RANGE_STRINGIFY(x: anytype) @TypeOf(__API_RANGE_STRINGIFY2(x)) {
    return __API_RANGE_STRINGIFY2(x);
}
pub inline fn __API_AVAILABLE_BEGIN1(a: anytype) @TypeOf(__API_A_BEGIN(a)) {
    return __API_A_BEGIN(a);
}
pub inline fn __API_AVAILABLE_BEGIN2(a: anytype, b: anytype) @TypeOf(__API_A_BEGIN(a) ++ __API_A_BEGIN(b)) {
    return __API_A_BEGIN(a) ++ __API_A_BEGIN(b);
}
pub inline fn __API_AVAILABLE_BEGIN3(a: anytype, b: anytype, c: anytype) @TypeOf(__API_A_BEGIN(a) ++ (__API_A_BEGIN(b) ++ __API_A_BEGIN(c))) {
    return __API_A_BEGIN(a) ++ (__API_A_BEGIN(b) ++ __API_A_BEGIN(c));
}
pub inline fn __API_AVAILABLE_BEGIN4(a: anytype, b: anytype, c: anytype, d: anytype) @TypeOf(__API_A_BEGIN(a) ++ (__API_A_BEGIN(b) ++ (__API_A_BEGIN(c) ++ __API_A_BEGIN(d)))) {
    return __API_A_BEGIN(a) ++ (__API_A_BEGIN(b) ++ (__API_A_BEGIN(c) ++ __API_A_BEGIN(d)));
}
pub inline fn __API_AVAILABLE_BEGIN5(a: anytype, b: anytype, c: anytype, d: anytype, e: anytype) @TypeOf(__API_A_BEGIN(a) ++ (__API_A_BEGIN(b) ++ (__API_A_BEGIN(c) ++ (__API_A_BEGIN(d) ++ __API_A_BEGIN(e))))) {
    return __API_A_BEGIN(a) ++ (__API_A_BEGIN(b) ++ (__API_A_BEGIN(c) ++ (__API_A_BEGIN(d) ++ __API_A_BEGIN(e))));
}
pub inline fn __API_AVAILABLE_BEGIN6(a: anytype, b: anytype, c: anytype, d: anytype, e: anytype, f: anytype) @TypeOf(__API_A_BEGIN(a) ++ (__API_A_BEGIN(b) ++ (__API_A_BEGIN(c) ++ (__API_A_BEGIN(d) ++ (__API_A_BEGIN(e) ++ __API_A_BEGIN(f)))))) {
    return __API_A_BEGIN(a) ++ (__API_A_BEGIN(b) ++ (__API_A_BEGIN(c) ++ (__API_A_BEGIN(d) ++ (__API_A_BEGIN(e) ++ __API_A_BEGIN(f)))));
}
pub inline fn __API_AVAILABLE_BEGIN7(a: anytype, b: anytype, c: anytype, d: anytype, e: anytype, f: anytype, g: anytype) @TypeOf(__API_A_BEGIN(a) ++ (__API_A_BEGIN(b) ++ (__API_A_BEGIN(c) ++ (__API_A_BEGIN(d) ++ (__API_A_BEGIN(e) ++ (__API_A_BEGIN(f) ++ __API_A_BEGIN(g))))))) {
    return __API_A_BEGIN(a) ++ (__API_A_BEGIN(b) ++ (__API_A_BEGIN(c) ++ (__API_A_BEGIN(d) ++ (__API_A_BEGIN(e) ++ (__API_A_BEGIN(f) ++ __API_A_BEGIN(g))))));
}
pub inline fn __API_DEPRECATED_MSG2(msg: anytype, x: anytype) @TypeOf(__API_D(msg, x)) {
    return __API_D(msg, x);
}
pub inline fn __API_DEPRECATED_MSG3(msg: anytype, x: anytype, y: anytype) @TypeOf(__API_D(msg, x) ++ __API_D(msg, y)) {
    return __API_D(msg, x) ++ __API_D(msg, y);
}
pub inline fn __API_DEPRECATED_MSG4(msg: anytype, x: anytype, y: anytype, z: anytype) @TypeOf(__API_DEPRECATED_MSG3(msg, x, y) ++ __API_D(msg, z)) {
    return __API_DEPRECATED_MSG3(msg, x, y) ++ __API_D(msg, z);
}
pub inline fn __API_DEPRECATED_MSG5(msg: anytype, x: anytype, y: anytype, z: anytype, t: anytype) @TypeOf(__API_DEPRECATED_MSG4(msg, x, y, z) ++ __API_D(msg, t)) {
    return __API_DEPRECATED_MSG4(msg, x, y, z) ++ __API_D(msg, t);
}
pub inline fn __API_DEPRECATED_MSG6(msg: anytype, x: anytype, y: anytype, z: anytype, t: anytype, b: anytype) @TypeOf(__API_DEPRECATED_MSG5(msg, x, y, z, t) ++ __API_D(msg, b)) {
    return __API_DEPRECATED_MSG5(msg, x, y, z, t) ++ __API_D(msg, b);
}
pub inline fn __API_DEPRECATED_MSG7(msg: anytype, x: anytype, y: anytype, z: anytype, t: anytype, b: anytype, m: anytype) @TypeOf(__API_DEPRECATED_MSG6(msg, x, y, z, t, b) ++ __API_D(msg, m)) {
    return __API_DEPRECATED_MSG6(msg, x, y, z, t, b) ++ __API_D(msg, m);
}
pub inline fn __API_DEPRECATED_MSG8(msg: anytype, x: anytype, y: anytype, z: anytype, t: anytype, b: anytype, m: anytype, d: anytype) @TypeOf(__API_DEPRECATED_MSG7(msg, x, y, z, t, b, m) ++ __API_D(msg, d)) {
    return __API_DEPRECATED_MSG7(msg, x, y, z, t, b, m) ++ __API_D(msg, d);
}
pub inline fn __API_DEPRECATED_BEGIN_MSG2(msg: anytype, a: anytype) @TypeOf(__API_D_BEGIN(msg, a)) {
    return __API_D_BEGIN(msg, a);
}
pub inline fn __API_DEPRECATED_BEGIN_MSG3(msg: anytype, a: anytype, b: anytype) @TypeOf(__API_D_BEGIN(msg, a) ++ __API_D_BEGIN(msg, b)) {
    return __API_D_BEGIN(msg, a) ++ __API_D_BEGIN(msg, b);
}
pub inline fn __API_DEPRECATED_BEGIN_MSG4(msg: anytype, a: anytype, b: anytype, c: anytype) @TypeOf(__API_D_BEGIN(msg, a) ++ (__API_D_BEGIN(msg, b) ++ __API_D_BEGIN(msg, c))) {
    return __API_D_BEGIN(msg, a) ++ (__API_D_BEGIN(msg, b) ++ __API_D_BEGIN(msg, c));
}
pub inline fn __API_DEPRECATED_BEGIN_MSG5(msg: anytype, a: anytype, b: anytype, c: anytype, d: anytype) @TypeOf(__API_D_BEGIN(msg, a) ++ (__API_D_BEGIN(msg, b) ++ (__API_D_BEGIN(msg, c) ++ __API_D_BEGIN(msg, d)))) {
    return __API_D_BEGIN(msg, a) ++ (__API_D_BEGIN(msg, b) ++ (__API_D_BEGIN(msg, c) ++ __API_D_BEGIN(msg, d)));
}
pub inline fn __API_DEPRECATED_BEGIN_MSG6(msg: anytype, a: anytype, b: anytype, c: anytype, d: anytype, e: anytype) @TypeOf(__API_D_BEGIN(msg, a) ++ (__API_D_BEGIN(msg, b) ++ (__API_D_BEGIN(msg, c) ++ (__API_D_BEGIN(msg, d) ++ __API_D_BEGIN(msg, e))))) {
    return __API_D_BEGIN(msg, a) ++ (__API_D_BEGIN(msg, b) ++ (__API_D_BEGIN(msg, c) ++ (__API_D_BEGIN(msg, d) ++ __API_D_BEGIN(msg, e))));
}
pub inline fn __API_DEPRECATED_BEGIN_MSG7(msg: anytype, a: anytype, b: anytype, c: anytype, d: anytype, e: anytype, f: anytype) @TypeOf(__API_D_BEGIN(msg, a) ++ (__API_D_BEGIN(msg, b) ++ (__API_D_BEGIN(msg, c) ++ (__API_D_BEGIN(msg, d) ++ (__API_D_BEGIN(msg, e) ++ __API_D_BEGIN(msg, f)))))) {
    return __API_D_BEGIN(msg, a) ++ (__API_D_BEGIN(msg, b) ++ (__API_D_BEGIN(msg, c) ++ (__API_D_BEGIN(msg, d) ++ (__API_D_BEGIN(msg, e) ++ __API_D_BEGIN(msg, f)))));
}
pub inline fn __API_DEPRECATED_BEGIN_MSG8(msg: anytype, a: anytype, b: anytype, c: anytype, d: anytype, e: anytype, f: anytype, g: anytype) @TypeOf(__API_D_BEGIN(msg, a) ++ (__API_D_BEGIN(msg, b) ++ (__API_D_BEGIN(msg, c) ++ (__API_D_BEGIN(msg, d) ++ (__API_D_BEGIN(msg, e) ++ (__API_D_BEGIN(msg, f) ++ __API_D_BEGIN(msg, g))))))) {
    return __API_D_BEGIN(msg, a) ++ (__API_D_BEGIN(msg, b) ++ (__API_D_BEGIN(msg, c) ++ (__API_D_BEGIN(msg, d) ++ (__API_D_BEGIN(msg, e) ++ (__API_D_BEGIN(msg, f) ++ __API_D_BEGIN(msg, g))))));
}
pub inline fn __API_DEPRECATED_REP2(rep: anytype, x: anytype) @TypeOf(__API_R(rep, x)) {
    return __API_R(rep, x);
}
pub inline fn __API_DEPRECATED_REP3(rep: anytype, x: anytype, y: anytype) @TypeOf(__API_R(rep, x) ++ __API_R(rep, y)) {
    return __API_R(rep, x) ++ __API_R(rep, y);
}
pub inline fn __API_DEPRECATED_REP4(rep: anytype, x: anytype, y: anytype, z: anytype) @TypeOf(__API_DEPRECATED_REP3(rep, x, y) ++ __API_R(rep, z)) {
    return __API_DEPRECATED_REP3(rep, x, y) ++ __API_R(rep, z);
}
pub inline fn __API_DEPRECATED_REP5(rep: anytype, x: anytype, y: anytype, z: anytype, t: anytype) @TypeOf(__API_DEPRECATED_REP4(rep, x, y, z) ++ __API_R(rep, t)) {
    return __API_DEPRECATED_REP4(rep, x, y, z) ++ __API_R(rep, t);
}
pub inline fn __API_DEPRECATED_REP6(rep: anytype, x: anytype, y: anytype, z: anytype, t: anytype, b: anytype) @TypeOf(__API_DEPRECATED_REP5(rep, x, y, z, t) ++ __API_R(rep, b)) {
    return __API_DEPRECATED_REP5(rep, x, y, z, t) ++ __API_R(rep, b);
}
pub inline fn __API_DEPRECATED_REP7(rep: anytype, x: anytype, y: anytype, z: anytype, t: anytype, b: anytype, m: anytype) @TypeOf(__API_DEPRECATED_REP6(rep, x, y, z, t, b) ++ __API_R(rep, m)) {
    return __API_DEPRECATED_REP6(rep, x, y, z, t, b) ++ __API_R(rep, m);
}
pub inline fn __API_DEPRECATED_REP8(rep: anytype, x: anytype, y: anytype, z: anytype, t: anytype, b: anytype, m: anytype, d: anytype) @TypeOf(__API_DEPRECATED_REP7(rep, x, y, z, t, b, m) ++ __API_R(rep, d)) {
    return __API_DEPRECATED_REP7(rep, x, y, z, t, b, m) ++ __API_R(rep, d);
}
pub inline fn __API_DEPRECATED_BEGIN_REP2(rep: anytype, a: anytype) @TypeOf(__API_R_BEGIN(rep, a)) {
    return __API_R_BEGIN(rep, a);
}
pub inline fn __API_DEPRECATED_BEGIN_REP3(rep: anytype, a: anytype, b: anytype) @TypeOf(__API_R_BEGIN(rep, a) ++ __API_R_BEGIN(rep, b)) {
    return __API_R_BEGIN(rep, a) ++ __API_R_BEGIN(rep, b);
}
pub inline fn __API_DEPRECATED_BEGIN_REP4(rep: anytype, a: anytype, b: anytype, c: anytype) @TypeOf(__API_R_BEGIN(rep, a) ++ (__API_R_BEGIN(rep, b) ++ __API_R_BEGIN(rep, c))) {
    return __API_R_BEGIN(rep, a) ++ (__API_R_BEGIN(rep, b) ++ __API_R_BEGIN(rep, c));
}
pub inline fn __API_DEPRECATED_BEGIN_REP5(rep: anytype, a: anytype, b: anytype, c: anytype, d: anytype) @TypeOf(__API_R_BEGIN(rep, a) ++ (__API_R_BEGIN(rep, b) ++ (__API_R_BEGIN(rep, c) ++ __API_R_BEGIN(rep, d)))) {
    return __API_R_BEGIN(rep, a) ++ (__API_R_BEGIN(rep, b) ++ (__API_R_BEGIN(rep, c) ++ __API_R_BEGIN(rep, d)));
}
pub inline fn __API_DEPRECATED_BEGIN_REP6(rep: anytype, a: anytype, b: anytype, c: anytype, d: anytype, e: anytype) @TypeOf(__API_R_BEGIN(rep, a) ++ (__API_R_BEGIN(rep, b) ++ (__API_R_BEGIN(rep, c) ++ (__API_R_BEGIN(rep, d) ++ __API_R_BEGIN(rep, e))))) {
    return __API_R_BEGIN(rep, a) ++ (__API_R_BEGIN(rep, b) ++ (__API_R_BEGIN(rep, c) ++ (__API_R_BEGIN(rep, d) ++ __API_R_BEGIN(rep, e))));
}
pub inline fn __API_DEPRECATED_BEGIN_REP7(rep: anytype, a: anytype, b: anytype, c: anytype, d: anytype, e: anytype, f: anytype) @TypeOf(__API_R_BEGIN(rep, a) ++ (__API_R_BEGIN(rep, b) ++ (__API_R_BEGIN(rep, c) ++ (__API_R_BEGIN(rep, d) ++ (__API_R_BEGIN(rep, e) ++ __API_R_BEGIN(rep, f)))))) {
    return __API_R_BEGIN(rep, a) ++ (__API_R_BEGIN(rep, b) ++ (__API_R_BEGIN(rep, c) ++ (__API_R_BEGIN(rep, d) ++ (__API_R_BEGIN(rep, e) ++ __API_R_BEGIN(rep, f)))));
}
pub inline fn __API_DEPRECATED_BEGIN_REP8(rep: anytype, a: anytype, b: anytype, c: anytype, d: anytype, e: anytype, f: anytype, g: anytype) @TypeOf(__API_R_BEGIN(rep, a) ++ (__API_R_BEGIN(rep, b) ++ (__API_R_BEGIN(rep, c) ++ (__API_R_BEGIN(rep, d) ++ (__API_R_BEGIN(rep, e) ++ (__API_R_BEGIN(rep, f) ++ __API_R_BEGIN(rep, g))))))) {
    return __API_R_BEGIN(rep, a) ++ (__API_R_BEGIN(rep, b) ++ (__API_R_BEGIN(rep, c) ++ (__API_R_BEGIN(rep, d) ++ (__API_R_BEGIN(rep, e) ++ (__API_R_BEGIN(rep, f) ++ __API_R_BEGIN(rep, g))))));
}
pub const __API_UNAVAILABLE_PLATFORM_macos = blk: {
    _ = macos;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_macosx = blk: {
    _ = macosx;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_ios = blk: {
    _ = ios;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_watchos = blk: {
    _ = watchos;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_tvos = blk: {
    _ = tvos;
    break :blk unavailable;
};
pub const __API_UNAVAILABLE_PLATFORM_macCatalyst = blk: {
    _ = macCatalyst;
    break :blk unavailable;
};
pub inline fn __API_UNAVAILABLE_PLATFORM_uikitformac(x: anytype) @TypeOf(unavailable) {
    return blk: {
        _ = uikitformac;
        break :blk unavailable;
    };
}
pub const __API_UNAVAILABLE_PLATFORM_driverkit = blk: {
    _ = driverkit;
    break :blk unavailable;
};
pub inline fn __API_UNAVAILABLE1(x: anytype) @TypeOf(__API_U(x)) {
    return __API_U(x);
}
pub inline fn __API_UNAVAILABLE2(x: anytype, y: anytype) @TypeOf(__API_U(x) ++ __API_U(y)) {
    return __API_U(x) ++ __API_U(y);
}
pub inline fn __API_UNAVAILABLE3(x: anytype, y: anytype, z: anytype) @TypeOf(__API_UNAVAILABLE2(x, y) ++ __API_U(z)) {
    return __API_UNAVAILABLE2(x, y) ++ __API_U(z);
}
pub inline fn __API_UNAVAILABLE4(x: anytype, y: anytype, z: anytype, t: anytype) @TypeOf(__API_UNAVAILABLE3(x, y, z) ++ __API_U(t)) {
    return __API_UNAVAILABLE3(x, y, z) ++ __API_U(t);
}
pub inline fn __API_UNAVAILABLE5(x: anytype, y: anytype, z: anytype, t: anytype, b: anytype) @TypeOf(__API_UNAVAILABLE4(x, y, z, t) ++ __API_U(b)) {
    return __API_UNAVAILABLE4(x, y, z, t) ++ __API_U(b);
}
pub inline fn __API_UNAVAILABLE6(x: anytype, y: anytype, z: anytype, t: anytype, b: anytype, m: anytype) @TypeOf(__API_UNAVAILABLE5(x, y, z, t, b) ++ __API_U(m)) {
    return __API_UNAVAILABLE5(x, y, z, t, b) ++ __API_U(m);
}
pub inline fn __API_UNAVAILABLE7(x: anytype, y: anytype, z: anytype, t: anytype, b: anytype, m: anytype, d: anytype) @TypeOf(__API_UNAVAILABLE6(x, y, z, t, b, m) ++ __API_U(d)) {
    return __API_UNAVAILABLE6(x, y, z, t, b, m) ++ __API_U(d);
}
pub inline fn __API_UNAVAILABLE_BEGIN1(a: anytype) @TypeOf(__API_U_BEGIN(a)) {
    return __API_U_BEGIN(a);
}
pub inline fn __API_UNAVAILABLE_BEGIN2(a: anytype, b: anytype) @TypeOf(__API_U_BEGIN(a) ++ __API_U_BEGIN(b)) {
    return __API_U_BEGIN(a) ++ __API_U_BEGIN(b);
}
pub inline fn __API_UNAVAILABLE_BEGIN3(a: anytype, b: anytype, c: anytype) @TypeOf(__API_U_BEGIN(a) ++ (__API_U_BEGIN(b) ++ __API_U_BEGIN(c))) {
    return __API_U_BEGIN(a) ++ (__API_U_BEGIN(b) ++ __API_U_BEGIN(c));
}
pub inline fn __API_UNAVAILABLE_BEGIN4(a: anytype, b: anytype, c: anytype, d: anytype) @TypeOf(__API_U_BEGIN(a) ++ (__API_U_BEGIN(b) ++ (__API_U_BEGIN(c) ++ __API_U_BEGIN(d)))) {
    return __API_U_BEGIN(a) ++ (__API_U_BEGIN(b) ++ (__API_U_BEGIN(c) ++ __API_U_BEGIN(d)));
}
pub inline fn __API_UNAVAILABLE_BEGIN5(a: anytype, b: anytype, c: anytype, d: anytype, e: anytype) @TypeOf(__API_U_BEGIN(a) ++ (__API_U_BEGIN(b) ++ (__API_U_BEGIN(c) ++ (__API_U_BEGIN(d) ++ __API_U_BEGIN(e))))) {
    return __API_U_BEGIN(a) ++ (__API_U_BEGIN(b) ++ (__API_U_BEGIN(c) ++ (__API_U_BEGIN(d) ++ __API_U_BEGIN(e))));
}
pub inline fn __API_UNAVAILABLE_BEGIN6(a: anytype, b: anytype, c: anytype, d: anytype, e: anytype, f: anytype) @TypeOf(__API_U_BEGIN(a) ++ (__API_U_BEGIN(b) ++ (__API_U_BEGIN(c) ++ (__API_U_BEGIN(d) ++ (__API_U_BEGIN(e) ++ __API_U_BEGIN(f)))))) {
    return __API_U_BEGIN(a) ++ (__API_U_BEGIN(b) ++ (__API_U_BEGIN(c) ++ (__API_U_BEGIN(d) ++ (__API_U_BEGIN(e) ++ __API_U_BEGIN(f)))));
}
pub inline fn __API_UNAVAILABLE_BEGIN7(a: anytype, b: anytype, c: anytype, d: anytype, e: anytype, f: anytype) @TypeOf(__API_U_BEGIN(a) ++ (__API_U_BEGIN(b) ++ (__API_U_BEGIN(c) ++ (__API_U_BEGIN(d) ++ (__API_U_BEGIN(e) ++ (__API_U_BEGIN(f) ++ __API_U_BEGIN(g))))))) {
    return __API_U_BEGIN(a) ++ (__API_U_BEGIN(b) ++ (__API_U_BEGIN(c) ++ (__API_U_BEGIN(d) ++ (__API_U_BEGIN(e) ++ (__API_U_BEGIN(f) ++ __API_U_BEGIN(g))))));
}
pub inline fn __OS_AVAILABILITY(_target: anytype, _availability: anytype) @TypeOf(__attribute__(availability(_target, _availability))) {
    return __attribute__(availability(_target, _availability));
}
pub inline fn __OSX_EXTENSION_UNAVAILABLE(_msg: anytype) @TypeOf(__OS_AVAILABILITY_MSG(macosx_app_extension, unavailable, _msg)) {
    return __OS_AVAILABILITY_MSG(macosx_app_extension, unavailable, _msg);
}
pub inline fn __IOS_EXTENSION_UNAVAILABLE(_msg: anytype) @TypeOf(__OS_AVAILABILITY_MSG(ios_app_extension, unavailable, _msg)) {
    return __OS_AVAILABILITY_MSG(ios_app_extension, unavailable, _msg);
}
pub inline fn __OS_EXTENSION_UNAVAILABLE(_msg: anytype) @TypeOf(__OSX_EXTENSION_UNAVAILABLE(_msg) ++ __IOS_EXTENSION_UNAVAILABLE(_msg)) {
    return __OSX_EXTENSION_UNAVAILABLE(_msg) ++ __IOS_EXTENSION_UNAVAILABLE(_msg);
}
pub const __OSX_UNAVAILABLE = __OS_AVAILABILITY(macosx, unavailable);
pub const __IOS_UNAVAILABLE = __OS_AVAILABILITY(ios, unavailable);
pub const __IOS_PROHIBITED = __OS_AVAILABILITY(ios, unavailable);
pub const __TVOS_UNAVAILABLE = __OS_AVAILABILITY(tvos, unavailable);
pub const __TVOS_PROHIBITED = __OS_AVAILABILITY(tvos, unavailable);
pub const __WATCHOS_UNAVAILABLE = __OS_AVAILABILITY(watchos, unavailable);
pub const __WATCHOS_PROHIBITED = __OS_AVAILABILITY(watchos, unavailable);
pub const __SWIFT_UNAVAILABLE = __OS_AVAILABILITY(swift, unavailable);
pub inline fn __SWIFT_UNAVAILABLE_MSG(_msg: anytype) @TypeOf(__OS_AVAILABILITY_MSG(swift, unavailable, _msg)) {
    return __OS_AVAILABILITY_MSG(swift, unavailable, _msg);
}
pub const __API_AVAILABLE_END = _Pragma("clang attribute pop");
pub const __API_DEPRECATED_END = _Pragma("clang attribute pop");
pub const __API_DEPRECATED_WITH_REPLACEMENT_END = _Pragma("clang attribute pop");
pub const __API_UNAVAILABLE_END = _Pragma("clang attribute pop");
pub const USER_ADDR_NULL = (@import("std").meta.cast(user_addr_t, 0));
pub inline fn CAST_USER_ADDR_T(a_ptr: anytype) @TypeOf((@import("std").meta.cast(user_addr_t, (@import("std").meta.cast(usize, a_ptr))))) {
    return (@import("std").meta.cast(user_addr_t, (@import("std").meta.cast(usize, a_ptr))));
}
pub const NULL = __DARWIN_NULL;
pub const CLOCKS_PER_SEC = 1000000;
pub const __CLOCK_AVAILABILITY = __OSX_AVAILABLE(10.12) ++ (__IOS_AVAILABLE(10.0) ++ (__TVOS_AVAILABLE(10.0) ++ __WATCHOS_AVAILABLE(3.0)));
pub const CLOCK_REALTIME = _CLOCK_REALTIME;
pub const CLOCK_MONOTONIC = _CLOCK_MONOTONIC;
pub const CLOCK_MONOTONIC_RAW = _CLOCK_MONOTONIC_RAW;
pub const CLOCK_MONOTONIC_RAW_APPROX = _CLOCK_MONOTONIC_RAW_APPROX;
pub const CLOCK_UPTIME_RAW = _CLOCK_UPTIME_RAW;
pub const CLOCK_UPTIME_RAW_APPROX = _CLOCK_UPTIME_RAW_APPROX;
pub const CLOCK_PROCESS_CPUTIME_ID = _CLOCK_PROCESS_CPUTIME_ID;
pub const CLOCK_THREAD_CPUTIME_ID = _CLOCK_THREAD_CPUTIME_ID;
pub const TIME_UTC = 1;
pub const QOS_MIN_RELATIVE_PRIORITY = -15;
pub const PTHREAD_CREATE_JOINABLE = 1;
pub const PTHREAD_CREATE_DETACHED = 2;
pub const PTHREAD_INHERIT_SCHED = 1;
pub const PTHREAD_EXPLICIT_SCHED = 2;
pub const PTHREAD_CANCEL_ENABLE = 0x01;
pub const PTHREAD_CANCEL_DISABLE = 0x00;
pub const PTHREAD_CANCEL_DEFERRED = 0x02;
pub const PTHREAD_CANCEL_ASYNCHRONOUS = 0x00;
pub const PTHREAD_CANCELED = (@import("std").meta.cast(?*c_void, 1));
pub const PTHREAD_SCOPE_SYSTEM = 1;
pub const PTHREAD_SCOPE_PROCESS = 2;
pub const PTHREAD_PROCESS_SHARED = 1;
pub const PTHREAD_PROCESS_PRIVATE = 2;
pub const PTHREAD_PRIO_NONE = 0;
pub const PTHREAD_PRIO_INHERIT = 1;
pub const PTHREAD_PRIO_PROTECT = 2;
pub const PTHREAD_MUTEX_NORMAL = 0;
pub const PTHREAD_MUTEX_ERRORCHECK = 1;
pub const PTHREAD_MUTEX_RECURSIVE = 2;
pub const PTHREAD_MUTEX_DEFAULT = PTHREAD_MUTEX_NORMAL;
pub const PTHREAD_MUTEX_POLICY_FAIRSHARE_NP = 1;
pub const PTHREAD_MUTEX_POLICY_FIRSTFIT_NP = 3;
pub const _PTHREAD_SWIFT_IMPORTER_NULLABILITY_COMPAT = (defined(SWIFT_CLASS_EXTRA) != 0) and !(defined(SWIFT_SDK_OVERLAY_PTHREAD_EPOCH) != 0) or (SWIFT_SDK_OVERLAY_PTHREAD_EPOCH < 1);
pub inline fn offsetof(t: anytype, d: anytype) @TypeOf(__builtin_offsetof(t, d)) {
    return __builtin_offsetof(t, d);
}
pub const MA_TRUE = 1;
pub const MA_FALSE = 0;
pub const MA_SIZE_MAX = 0xFFFFFFFF;
pub const MA_SIMD_ALIGNMENT = 64;
pub const MA_LOG_LEVEL_VERBOSE = 4;
pub const MA_LOG_LEVEL_INFO = 3;
pub const MA_LOG_LEVEL_WARNING = 2;
pub const MA_LOG_LEVEL_ERROR = 1;
pub const MA_LOG_LEVEL = MA_LOG_LEVEL_ERROR;
pub const MA_CHANNEL_NONE = 0;
pub const MA_CHANNEL_MONO = 1;
pub const MA_CHANNEL_FRONT_LEFT = 2;
pub const MA_CHANNEL_FRONT_RIGHT = 3;
pub const MA_CHANNEL_FRONT_CENTER = 4;
pub const MA_CHANNEL_LFE = 5;
pub const MA_CHANNEL_BACK_LEFT = 6;
pub const MA_CHANNEL_BACK_RIGHT = 7;
pub const MA_CHANNEL_FRONT_LEFT_CENTER = 8;
pub const MA_CHANNEL_FRONT_RIGHT_CENTER = 9;
pub const MA_CHANNEL_BACK_CENTER = 10;
pub const MA_CHANNEL_SIDE_LEFT = 11;
pub const MA_CHANNEL_SIDE_RIGHT = 12;
pub const MA_CHANNEL_TOP_CENTER = 13;
pub const MA_CHANNEL_TOP_FRONT_LEFT = 14;
pub const MA_CHANNEL_TOP_FRONT_CENTER = 15;
pub const MA_CHANNEL_TOP_FRONT_RIGHT = 16;
pub const MA_CHANNEL_TOP_BACK_LEFT = 17;
pub const MA_CHANNEL_TOP_BACK_CENTER = 18;
pub const MA_CHANNEL_TOP_BACK_RIGHT = 19;
pub const MA_CHANNEL_AUX_0 = 20;
pub const MA_CHANNEL_AUX_1 = 21;
pub const MA_CHANNEL_AUX_2 = 22;
pub const MA_CHANNEL_AUX_3 = 23;
pub const MA_CHANNEL_AUX_4 = 24;
pub const MA_CHANNEL_AUX_5 = 25;
pub const MA_CHANNEL_AUX_6 = 26;
pub const MA_CHANNEL_AUX_7 = 27;
pub const MA_CHANNEL_AUX_8 = 28;
pub const MA_CHANNEL_AUX_9 = 29;
pub const MA_CHANNEL_AUX_10 = 30;
pub const MA_CHANNEL_AUX_11 = 31;
pub const MA_CHANNEL_AUX_12 = 32;
pub const MA_CHANNEL_AUX_13 = 33;
pub const MA_CHANNEL_AUX_14 = 34;
pub const MA_CHANNEL_AUX_15 = 35;
pub const MA_CHANNEL_AUX_16 = 36;
pub const MA_CHANNEL_AUX_17 = 37;
pub const MA_CHANNEL_AUX_18 = 38;
pub const MA_CHANNEL_AUX_19 = 39;
pub const MA_CHANNEL_AUX_20 = 40;
pub const MA_CHANNEL_AUX_21 = 41;
pub const MA_CHANNEL_AUX_22 = 42;
pub const MA_CHANNEL_AUX_23 = 43;
pub const MA_CHANNEL_AUX_24 = 44;
pub const MA_CHANNEL_AUX_25 = 45;
pub const MA_CHANNEL_AUX_26 = 46;
pub const MA_CHANNEL_AUX_27 = 47;
pub const MA_CHANNEL_AUX_28 = 48;
pub const MA_CHANNEL_AUX_29 = 49;
pub const MA_CHANNEL_AUX_30 = 50;
pub const MA_CHANNEL_AUX_31 = 51;
pub const MA_CHANNEL_LEFT = MA_CHANNEL_FRONT_LEFT;
pub const MA_CHANNEL_RIGHT = MA_CHANNEL_FRONT_RIGHT;
pub const MA_CHANNEL_POSITION_COUNT = MA_CHANNEL_AUX_31 + 1;
pub const MA_SUCCESS = 0;
pub const MA_ERROR = -1;
pub const MA_INVALID_ARGS = -2;
pub const MA_INVALID_OPERATION = -3;
pub const MA_OUT_OF_MEMORY = -4;
pub const MA_OUT_OF_RANGE = -5;
pub const MA_ACCESS_DENIED = -6;
pub const MA_DOES_NOT_EXIST = -7;
pub const MA_ALREADY_EXISTS = -8;
pub const MA_TOO_MANY_OPEN_FILES = -9;
pub const MA_INVALID_FILE = -10;
pub const MA_TOO_BIG = -11;
pub const MA_PATH_TOO_LONG = -12;
pub const MA_NAME_TOO_LONG = -13;
pub const MA_NOT_DIRECTORY = -14;
pub const MA_IS_DIRECTORY = -15;
pub const MA_DIRECTORY_NOT_EMPTY = -16;
pub const MA_END_OF_FILE = -17;
pub const MA_NO_SPACE = -18;
pub const MA_BUSY = -19;
pub const MA_IO_ERROR = -20;
pub const MA_INTERRUPT = -21;
pub const MA_UNAVAILABLE = -22;
pub const MA_ALREADY_IN_USE = -23;
pub const MA_BAD_ADDRESS = -24;
pub const MA_BAD_SEEK = -25;
pub const MA_BAD_PIPE = -26;
pub const MA_DEADLOCK = -27;
pub const MA_TOO_MANY_LINKS = -28;
pub const MA_NOT_IMPLEMENTED = -29;
pub const MA_NO_MESSAGE = -30;
pub const MA_BAD_MESSAGE = -31;
pub const MA_NO_DATA_AVAILABLE = -32;
pub const MA_INVALID_DATA = -33;
pub const MA_TIMEOUT = -34;
pub const MA_NO_NETWORK = -35;
pub const MA_NOT_UNIQUE = -36;
pub const MA_NOT_SOCKET = -37;
pub const MA_NO_ADDRESS = -38;
pub const MA_BAD_PROTOCOL = -39;
pub const MA_PROTOCOL_UNAVAILABLE = -40;
pub const MA_PROTOCOL_NOT_SUPPORTED = -41;
pub const MA_PROTOCOL_FAMILY_NOT_SUPPORTED = -42;
pub const MA_ADDRESS_FAMILY_NOT_SUPPORTED = -43;
pub const MA_SOCKET_NOT_SUPPORTED = -44;
pub const MA_CONNECTION_RESET = -45;
pub const MA_ALREADY_CONNECTED = -46;
pub const MA_NOT_CONNECTED = -47;
pub const MA_CONNECTION_REFUSED = -48;
pub const MA_NO_HOST = -49;
pub const MA_IN_PROGRESS = -50;
pub const MA_CANCELLED = -51;
pub const MA_MEMORY_ALREADY_MAPPED = -52;
pub const MA_AT_END = -53;
pub const MA_FORMAT_NOT_SUPPORTED = -100;
pub const MA_DEVICE_TYPE_NOT_SUPPORTED = -101;
pub const MA_SHARE_MODE_NOT_SUPPORTED = -102;
pub const MA_NO_BACKEND = -103;
pub const MA_NO_DEVICE = -104;
pub const MA_API_NOT_FOUND = -105;
pub const MA_INVALID_DEVICE_CONFIG = -106;
pub const MA_DEVICE_NOT_INITIALIZED = -200;
pub const MA_DEVICE_ALREADY_INITIALIZED = -201;
pub const MA_DEVICE_NOT_STARTED = -202;
pub const MA_DEVICE_NOT_STOPPED = -203;
pub const MA_FAILED_TO_INIT_BACKEND = -300;
pub const MA_FAILED_TO_OPEN_BACKEND_DEVICE = -301;
pub const MA_FAILED_TO_START_BACKEND_DEVICE = -302;
pub const MA_FAILED_TO_STOP_BACKEND_DEVICE = -303;
pub const MA_SAMPLE_RATE_8000 = 8000;
pub const MA_SAMPLE_RATE_11025 = 11025;
pub const MA_SAMPLE_RATE_16000 = 16000;
pub const MA_SAMPLE_RATE_22050 = 22050;
pub const MA_SAMPLE_RATE_24000 = 24000;
pub const MA_SAMPLE_RATE_32000 = 32000;
pub const MA_SAMPLE_RATE_44100 = 44100;
pub const MA_SAMPLE_RATE_48000 = 48000;
pub const MA_SAMPLE_RATE_88200 = 88200;
pub const MA_SAMPLE_RATE_96000 = 96000;
pub const MA_SAMPLE_RATE_176400 = 176400;
pub const MA_SAMPLE_RATE_192000 = 192000;
pub const MA_SAMPLE_RATE_352800 = 352800;
pub const MA_SAMPLE_RATE_384000 = 384000;
pub const MA_MIN_CHANNELS = 1;
pub const MA_MAX_CHANNELS = 32;
pub const MA_MIN_SAMPLE_RATE = MA_SAMPLE_RATE_8000;
pub const MA_MAX_SAMPLE_RATE = MA_SAMPLE_RATE_384000;
pub const MA_MAX_FILTER_ORDER = 8;
pub const MA_OPEN_MODE_READ = 0x00000001;
pub const MA_OPEN_MODE_WRITE = 0x00000002;
pub const MA_ALLOCATION_TYPE_GENERAL = 0x00000001;
pub const MA_ALLOCATION_TYPE_CONTEXT = 0x00000002;
pub const MA_ALLOCATION_TYPE_DEVICE = 0x00000003;
pub const MA_ALLOCATION_TYPE_DECODER = 0x00000004;
pub const MA_ALLOCATION_TYPE_AUDIO_BUFFER = 0x00000005;
pub const MA_ALLOCATION_TYPE_ENCODED_BUFFER = 0x00000006;
pub const MA_ALLOCATION_TYPE_DECODED_BUFFER = 0x00000007;
pub const MA_ALLOCATION_TYPE_RESOURCE_MANAGER_DATA_BUFFER_NODE = 0x00000010;
pub const MA_ALLOCATION_TYPE_RESOURCE_MANAGER_DATA_BUFFER = 0x00000011;
pub const MA_ALLOCATION_TYPE_RESOURCE_MANAGER_DATA_STREAM = 0x00000012;
pub const MA_ALLOCATION_TYPE_RESOURCE_MANAGER_DATA_SOURCE = 0x00000013;
pub const MA_DATA_SOURCE_FLAG_STREAM = 0x00000001;
pub const MA_DATA_SOURCE_FLAG_DECODE = 0x00000002;
pub const MA_DATA_SOURCE_FLAG_ASYNC = 0x00000004;
pub const MA_RESOURCE_MANAGER_JOB_QUEUE_CAPACITY = 1024;
pub const MA_JOB_QUIT = 0x00000000;
pub const MA_JOB_LOAD_DATA_BUFFER = 0x00000001;
pub const MA_JOB_FREE_DATA_BUFFER = 0x00000002;
pub const MA_JOB_PAGE_DATA_BUFFER = 0x00000003;
pub const MA_JOB_LOAD_DATA_STREAM = 0x00000004;
pub const MA_JOB_FREE_DATA_STREAM = 0x00000005;
pub const MA_JOB_PAGE_DATA_STREAM = 0x00000006;
pub const MA_JOB_SEEK_DATA_STREAM = 0x00000007;
pub const MA_JOB_CUSTOM = 0x000000FF;
pub const MA_NOTIFICATION_COMPLETE = 0;
pub const MA_NOTIFICATION_INIT = 1;
pub const MA_NOTIFICATION_FAILED = 2;
pub const MA_JOB_QUEUE_FLAG_NON_BLOCKING = 0x00000001;
pub const MA_RESOURCE_MANAGER_MAX_JOB_THREAD_COUNT = 64;
pub const MA_RESOURCE_MANAGER_FLAG_NON_BLOCKING = 0x00000001;
pub const __darwin_pthread_handler_rec = struct___darwin_pthread_handler_rec;
pub const _opaque_pthread_attr_t = struct__opaque_pthread_attr_t;
pub const _opaque_pthread_cond_t = struct__opaque_pthread_cond_t;
pub const _opaque_pthread_condattr_t = struct__opaque_pthread_condattr_t;
pub const _opaque_pthread_mutex_t = struct__opaque_pthread_mutex_t;
pub const _opaque_pthread_mutexattr_t = struct__opaque_pthread_mutexattr_t;
pub const _opaque_pthread_once_t = struct__opaque_pthread_once_t;
pub const _opaque_pthread_rwlock_t = struct__opaque_pthread_rwlock_t;
pub const _opaque_pthread_rwlockattr_t = struct__opaque_pthread_rwlockattr_t;
pub const _opaque_pthread_t = struct__opaque_pthread_t;
pub const sched_param = struct_sched_param;
pub const timespec = struct_timespec;
pub const tm = struct_tm;
pub const pthread_override_s = struct_pthread_override_s;
