# Changelog

## master (unreleased)

### New features

* Add some interpreter builtin-modules
* Support ml64 assembler for windows x64

### Changes

* Improve ipairs and pairs interfaces and support filter
* Add filters for generating vs201x project
* Remove `core/tools` (msys toolchains) and uses xmake to compile core sources on windows
* Remove `xmake/packages` for templates

### Bugs fixed

* Fix `-def:xxx.def` flags failed for msvc
* Fix ml.exe assembler script

## v2.0.4

### New features

* Add native shell support for `xmake.lua`. .e.g `add_ldflags("$(shell pkg-config --libs sqlite3)")`
* Enable pdb symbol files for windows
* Add debugger support on windows (vsjitdebugger, ollydbg, windbg ... )
* Add `getenv` interface for the global scope of `xmake.lua`
* Add plugin for generating vstudio project file (vs2002 - vs2015)
* Add `set_default` api for option

### Changes

* Improve builtin-variable format
* Support option for string type

### Bugs fixed

* Fix check ld failed without g++ on linux 
* Fix compile `*.cxx` files failed

## v2.0.3

### New features 

* Add check includes dependence automatically
* Add print colors 
* Add debugger support, .e.g `xmake run -d program ...`

### Changes

* Improve the interfaces of run shell
* Upgrade luajit to v2.0.4
* Improve to generate makefile plugin
* Optimizate the multitasking compiling speed

### Bugs fixed

* Fix install directory bug
* Fix the root directory error for `import` interface
* Fix check visual stdio error on windows

## v2.0.2

### Changes

* Change install and uninstall actions
* Update templates
* Improve to check function 

### Bugs fixed

* [#7](https://github.com/waruqi/xmake/issues/7): Fix create project bug with '[targetname]'
* [#9](https://github.com/waruqi/xmake/issues/9): Support clang with c++11
* Fix api scope leaks bug
* Fix path bug for windows
* Fix check function bug
* Fix check toolchains failed
* Fix compile failed for android on windows 

## v2.0.1

### New features

* Add task api for running custom tasks
* Add plugin expansion and provide some builtin plugins
* Add export ide project plugin(.e.g makefile and will support to export other projects for vs, xcode in feature)
* Add demo plugin for printing 'hello xmake'
* Add make doxygen documents plugin
* Add macro script plugin
* Add more modules for developing plugin
* Add exception using try/catch and simplify grammar for plugin script
* Add option bindings
* Show progress when building

### Changes

* Rewrite interpreter for xmake.lua
* More strict syntax detection mechanism
* More strict api scope for xmake.lua 
* Simplify template development
* Extend platforms, tools, templates and actions fastly
* Simplify api and support import modules
* Remove dependence for gnu make/nmake, no longer need makefile
* Optimize speed for building and faster x4 than v1.0.4
* Optimize automatic detection 
* Modify some api name, but be compatible with the old version
* Optimize merging static library
* Simplify cross compilation using argument `--sdk=xxx`
* Simplify boolean option for command line, .e.g `xmake config --xxx=[y|n|yes|no|true|false]`
* Merge iphoneos and iphonesimulator platforms
* Merge watchos and watchsimulator platformss

### Bugs fixed

* [#3](https://github.com/waruqi/xmake/issues/3): ArchLinux compilation failed
* [#4](https://github.com/waruqi/xmake/issues/4): Install failed for windows
* Fix envirnoment variable bug for windows

## v1.0.4

### New features

* Support windows assembler
* Add some project templates
* Support swift codes
* Add -v argument for outputing more verbose info
* Add apple platforms��watchos, watchsimulator
* Add architecture x64, amd64, x86_amd64 for windows
* Support switch static and share library
* Add -j/--jobs argument for supporting multi-jobs 

### Changes

* Improve `add_files` api and support to add *.o/obj/a/lib files for merging static library and object files
* Optimize installation and remove some binary files

### Bugs fixed

* [#1](https://github.com/waruqi/xmake/issues/4): Install failed for win7
* Fix checking toolchains bug
* Fix install script bug
* Fix install bug for linux x86_64

## v1.0.3

### New features

* Add set_runscript api and support custom action
* Add import api and support import modules in xmake.lua, .e.g os, path, utils ...
* Add new architecture: arm64-v8a for android

### Bugs fixed

* Fix api bug for set_installscript
* Fix install bug for windows x86_64
* Fix relative path bug


# ������־

## master (������)

### ������

* Ϊ����������������һЩ�ڽ�ģ��֧��
* ���windows x64ƽ̨��֧��ml64�����

### �Ľ�

* ��ǿipairs��pairs�ӿڣ�֧�ֹ�����ģʽ���򻯽ű�����
* Ϊvs201x�������������ļ�filter
* �Ƴ�`core/tools`Ŀ¼�Լ�msys����������windows��ʹ��xmake�Ա���coreԴ����а�װ���Ż�xmakeԴ����̿ռ�
* �Ƴ�`xmake/packages`��Ĭ��ģ�尲װ�������ö�����packages����ʱ��Ҫ�ֶ����ã��Ժ��������Զ����������ر���

### Bugs�޸�

* �޸�msvc�ı���ѡ�֧�����⣺`-def:xxx.def`
* �޸�ml.exe������ű�

## v2.0.4

### ������

* ��`xmake.lua`�����ԭ��shell֧�֣����磺`add_ldflags("$(shell pkg-config --libs sqlite3)")`
* ����windowsĿ�����Ĭ��Ĭ������pdb�����ļ�
* ��windows����ӵ�����֧�֣�vsjitdebugger, ollydbg, windbg ... ��
* ���`getenv`�ӿڵ�`xmake.lua`��ȫ����������
* �������vstudio���̲��(֧�֣�vs2002 - vs2015)
* Ϊoption���`set_default`�ӿ�

### �Ľ�

* ��ǿ�ڽ������Ĵ���
* ֧���ַ������͵�ѡ��option����

### Bugs�޸�

* �޸���linux�¼��ld������ʧ�ܣ����ûװg++�Ļ�
* �޸�`*.cxx`����ʧ������

## v2.0.3

### ������

* ����ͷ�ļ������Զ������������룬��߱����ٶ�
* ���ն��н�����ɫ������ʾ
* ��ӵ�����֧�֣�`xmake run -d program ...`

### �Ľ�

* ��ǿ����shell��ϵ�нӿ�
* ����luajit��v2.0.4�汾
* �Ľ�makefile���ɲ�����Ƴ���xmake������������֧��`windows/linux/macosx`�ȴ󲿷�pcƽ̨
* �Ż�����������ٶȣ���windows�±���������Ϊ����

### Bugs�޸�

* �޸���װĿ¼��������
* �޸�`import`��Ŀ¼��������
* �޸��ڶ�汾vsͬʱ���ڵ�����£����vs����ʧ������

## v2.0.2

### �Ľ�

* �޸İ�װ��ж�ص�action����
* ���¹���ģ��
* ��ǿ�������

### Bugs�޸�

* [#7](https://github.com/waruqi/xmake/issues/7): �޸���ģ�崴�����̺�target���������⣺'[targetname]'
* [#9](https://github.com/waruqi/xmake/issues/9): �޸�clang��֧��c++11������
* �޸�api������й¶����
* �޸���windows�ϵ�һЩ·������
* �޸����꺯��ʧ������
* �޸���⹤����ʧ������
* �޸�windows�ϱ���android�汾ʧ��

## v2.0.1

### ������

* ����task������ƣ��������Զ�������ű�
* ʵ��plugin��չ���ƣ����Ժܷ�����չʵ���Զ�������Ŀǰ��ʵ�ֵ�һЩ���ò��
* ����project�ļ��������(Ŀǰ��֧��makefile�����ɣ�������֧�֣�vs, xcode�ȹ��̵�����)
* ����hello xmake��������demo��
* ����doxygen�ĵ����ɲ��
* �����Զ����ű������֧�ֶ�̬���¼����طš������ꡢ�������롢�����ȹ��ܣ�
* ���Ӹ����������ڲ��������
* ʵ���쳣������ƣ����ϲ�����߼�
* ���Ӷ��option���к�󶨣�ʵ������һ���������Ϳ���ͬʱ�Զ�����ý�����Ч
* ������ʾȫ�ֹ�������

### �Ľ�

* �ع�����xmake.lua�����ļ��Ľ����������ӵ�������չ
* �����ϸ���﷨������
* �����ϸ�����������ʵ��ɳ�����棬��xmake.lua�нű�����ɳ�л�����ʹ��xmake.lua���ӵİ�ȫ
* ��ģ��Ŀ������򵥼��������Ϳ�����չһ���µ��Զ��幤��ģ��
* ��ȫģ�黯platforms��tools��templates��actions���Լ�ͨ����ע����ƣ�ֻ����Զ���Ľű������ӦĿ¼���Ϳ�ʵ�ֿ�����չ
* ������п���չ�ű�����api���д����򻯣���ʵ�ִ�����⣬ͨ��import���ƽ��е���ʹ��
* �Ƴ���gnu make/nmake��make���ߵ�������������Ҫmakefile��ʵ���Լ���make�㷨��
* �Ż������ٶȣ�֧�ֶ��������(֧��vs������)��ʵ�⣺��v1.0.4����x4���Ĺ������ܣ�
* �Ż��Զ������ƣ����ӵ��ȶ���׼ȷ
* �޸Ĳ��ֹ�������api����ǿ��չ�ԣ�����һЩ�������壨�ԵͰ汾���¼��ݣ�
* �Ż���̬��ϲ���`add_files("*.a")`���޸�һЩbug
* �Ż�������룬ͨ��`--sdk=xxx`����ʵ�ָ��ӷ������ܵĽ��н���������ã���mingwƽ̨�ı�������
* �����������ÿ���, ֧��`xmake config --xxx=[y|n|yes|no|true|false]`�ȿ���ֵ
* �ϲ�iphoneos��iphonesimulatorƽ̨���Լ�watchos��watchsimulatorƽ̨��ͨ��arch�����֣�ʹ�ô�����ӷ��㣬�ܹ�֧��һ���Դ��iphoneos������arch��һ������

### Bugs�޸�

* [#3](https://github.com/waruqi/xmake/issues/3): �޸�ArchLinux ����ʧ������
* [#4](https://github.com/waruqi/xmake/issues/4): �޸�windows�ϰ�װʧ������
* �޸�windows�ϻ���������������

## v1.0.4

### ������

* ���Ӷ�windows�������֧��
* Ϊxmake create����һЩ�µĹ���ģ�壬֧��tbox�汾
* ֧��swift����
* ���-v���������Ӵ��������Ϣ
* ����apple����ƽ̨��watchos, watchsimulator�ı���֧��
* ���Ӷ�windows: x64, amd64, x86_amd64�ܹ��ı���֧��
* ʵ�ֶ�̬��;�̬��Ŀ����л�
* ���-j/--jobs�������ֶ�ָ���Ƿ��������룬Ĭ�ϸ�Ϊ���������

### �Ľ�

* ��ǿadd_files�ӿڣ�֧��ֱ�����*.o/obj/a/lib�ļ�������֧�־�̬��ĺϲ�
* �ü�xmake�İ�װ���̣��Ƴ�һЩԤ����Ķ����Ƴ���

### Bugs�޸�

* [#1](https://github.com/waruqi/xmake/issues/4): �޸�win7�ϰ�װʧ������
* �޸�����ǿ���������
* �޸�һЩ��װ�ű���bug, �ĳ�����sudo���а�װ
* �޸�linux x86_64�°�װʧ������

## v1.0.3

### ������

* ���set_runscript�ӿڣ�֧���Զ������нű���չ
* ���import�ӿڣ�ʹ����xmake.lua�п��Ե���һЩ��չģ�飬���磺os��path��utils�ȵȣ�ʹ�ýű������
* ���androidƽ̨arm64-v8a֧��

### Bugs�޸�

* �޸�set_installscript�ӿڵ�һЩbug
* �޸���windows x86_64�£���װʧ�ܵ�����
* �޸����·����һЩbug
