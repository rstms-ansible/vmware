
.. Document meta

:orphan:

.. |antsibull-internal-nbsp| unicode:: 0xA0
    :trim:

.. meta::
  :antsibull-docs: 2.12.0

.. Anchors

.. _ansible_collections.rstms_ansible.vmware.workstation_instance_role:

.. Title

rstms_ansible.vmware.workstation_instance role
++++++++++++++++++++++++++++++++++++++++++++++

.. Collection note

.. note::
    This role is part of the `rstms_ansible.vmware collection <https://galaxy.ansible.com/ui/repo/published/rstms_ansible/vmware/>`_ (version 0.1.6).

    It is not included in ``ansible-core``.
    To check whether it is installed, run :code:`ansible-galaxy collection list`.

    To install it use: :code:`ansible-galaxy collection install rstms\_ansible.vmware`.

    To use it in a playbook, specify: :code:`rstms_ansible.vmware.workstation_instance`.

.. contents::
   :local:
   :depth: 2


.. Entry point title

Entry point ``workstation_instance`` -- a role for managing vmware workstation instances
----------------------------------------------------------------------------------------

.. version_added


.. Deprecated


Synopsis
^^^^^^^^

.. Description

- Create or Destroy a VM instance based on the value of the \`vm\_state\` variable.
- In a playbook using the role to create an instance, set \`gather\_facts\` to \`false\` since the instance will not yet exist.
- Uses a netboot server to facilitate boot, OS install, and initial configuration.
- A response file for the OS installer is generated and uploaded to the netboot server.
- An install package tarball is generated to be extracted at the root directory after installation, but before the initial boot.  See \`vm\_filesystem\_dir\`
- If the install package includes /install.site it is executed after the files are extracted.
- A \`firstboot\` script is generated during install and executed during the initial boot.  On Debian, this script will execute the /install.site script if present.
- The role can optionally wait for an installation-complete message from the firstboot script, before deleting the generated files from the netboot server and returning. If the wait is disabled, another mechanism must be used to delete these files.

.. Requirements


.. Options

Parameters
^^^^^^^^^^

.. tabularcolumns:: \X{1}{3}\X{2}{3}

.. list-table::
  :width: 100%
  :widths: auto
  :header-rows: 1
  :class: longtable ansible-option-table

  * - Parameter
    - Comments

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--netboot_dir"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__netboot_dir:

      .. rst-class:: ansible-option-title

      **netboot_dir**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--netboot_dir" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      directory on netboot host used for upload of response files and package install tarball


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"/var/www/netboot"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--netboot_fullscreen"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__netboot_fullscreen:

      .. rst-class:: ansible-option-title

      **netboot_fullscreen**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--netboot_fullscreen" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      start VM in full screen mode during netboot


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"False"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--netboot_gui"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__netboot_gui:

      .. rst-class:: ansible-option-title

      **netboot_gui**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--netboot_gui" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      start VM in windowed mode during netboot


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"False"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--netboot_host"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__netboot_host:

      .. rst-class:: ansible-option-title

      **netboot_host**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--netboot_host" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      netboot server hostname


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"netboot.rstms.net"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--netboot_iso"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__netboot_iso:

      .. rst-class:: ansible-option-title

      **netboot_iso**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--netboot_iso" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      URL of netboot ISO


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"http://netboot.rstms.net/rstms-netboot.iso"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--netboot_packages"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__netboot_packages:

      .. rst-class:: ansible-option-title

      **netboot_packages**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--netboot_packages" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      list of packages to install on first boot


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"py3-pip"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--netboot_timeout"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__netboot_timeout:

      .. rst-class:: ansible-option-title

      **netboot_timeout**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--netboot_timeout" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      netboot timeout value in seconds


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"300"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--netboot_wait"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__netboot_wait:

      .. rst-class:: ansible-option-title

      **netboot_wait**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--netboot_wait" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`boolean`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      wait for completion message and clean up generated files before returning


      .. rst-class:: ansible-option-line

      :ansible-option-choices:`Choices:`

      - :ansible-option-choices-entry:`false`
      - :ansible-option-choices-entry-default:`true` :ansible-option-choices-default-mark:`← (default)`


      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_cpu_count"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_cpu_count:

      .. rst-class:: ansible-option-title

      **vm_cpu_count**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_cpu_count" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`integer`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      VM CPU allocation


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`1`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_disk_mb"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_disk_mb:

      .. rst-class:: ansible-option-title

      **vm_disk_mb**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_disk_mb" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`integer`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      Virtual Disk size in MB


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`8192`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_fde_enabled"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_fde_enabled:

      .. rst-class:: ansible-option-title

      **vm_fde_enabled**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_fde_enabled" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`boolean`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      enable full disk encryption on VM guest


      .. rst-class:: ansible-option-line

      :ansible-option-choices:`Choices:`

      - :ansible-option-choices-entry-default:`false` :ansible-option-choices-default-mark:`← (default)`
      - :ansible-option-choices-entry:`true`


      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_fde_mode"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_fde_mode:

      .. rst-class:: ansible-option-title

      **vm_fde_mode**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_fde_mode" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      disk encryption type: \`p\` for passphrase \`d\` for disk


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"p"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_fde_passphrase_length"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_fde_passphrase_length:

      .. rst-class:: ansible-option-title

      **vm_fde_passphrase_length**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_fde_passphrase_length" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`integer`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      disk encryption minimum passphrase length


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`32`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_filesystem_dir"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_filesystem_dir:

      .. rst-class:: ansible-option-title

      **vm_filesystem_dir**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_filesystem_dir" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      local directory used for generation of site install package


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`""`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_headless"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_headless:

      .. rst-class:: ansible-option-title

      **vm_headless**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_headless" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`boolean`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      selects guest OS installation of X desktop


      .. rst-class:: ansible-option-line

      :ansible-option-choices:`Choices:`

      - :ansible-option-choices-entry:`false`
      - :ansible-option-choices-entry-default:`true` :ansible-option-choices-default-mark:`← (default)`


      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_hostname"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_hostname:

      .. rst-class:: ansible-option-title

      **vm_hostname**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_hostname" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string` / :ansible-option-required:`required`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      instance name


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"inventory\_hostname\_short"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_os"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_os:

      .. rst-class:: ansible-option-title

      **vm_os**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_os" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      netboot/autoinstall OS name


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"OpenBSD"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_os_arch"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_os_arch:

      .. rst-class:: ansible-option-title

      **vm_os_arch**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_os_arch" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      netboot/autoinstall OS architecture


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"amd64"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_os_version"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_os_version:

      .. rst-class:: ansible-option-title

      **vm_os_version**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_os_version" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      netboot/autoinstall OS version


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"7.5"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_password"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_password:

      .. rst-class:: ansible-option-title

      **vm_password**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_password" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      password used when creating vm\_username account


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"value of \`ansible\_become\_password\`"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_password_length"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_password_length:

      .. rst-class:: ansible-option-title

      **vm_password_length**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_password_length" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`integer`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      length of auto-generated root password


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`32`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_ram_mb"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_ram_mb:

      .. rst-class:: ansible-option-title

      **vm_ram_mb**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_ram_mb" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`integer`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      VM RAM allocation in MB


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`1024`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_secrets_file"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_secrets_file:

      .. rst-class:: ansible-option-title

      **vm_secrets_file**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_secrets_file" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      local filename for writing autogenerated root password with ansible-vault


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"False"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_ssh_public_key"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_ssh_public_key:

      .. rst-class:: ansible-option-title

      **vm_ssh_public_key**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_ssh_public_key" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      public key written to target's \`~/.ssh/authorized\_hosts\`


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"\`ansible\_user\` ~/.ssh/id\_ed25519.pub"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_sshd_enabled"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_sshd_enabled:

      .. rst-class:: ansible-option-title

      **vm_sshd_enabled**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_sshd_enabled" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`boolean`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      enable sshd during instance configuration


      .. rst-class:: ansible-option-line

      :ansible-option-choices:`Choices:`

      - :ansible-option-choices-entry:`false`
      - :ansible-option-choices-entry-default:`true` :ansible-option-choices-default-mark:`← (default)`


      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_state"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_state:

      .. rst-class:: ansible-option-title

      **vm_state**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_state" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string` / :ansible-option-required:`required`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      Create or Destroy a VM instance

      present - create, configure, and netboot an instance, then wait for installation

      absent - destroy an instance


      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_timezone"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_timezone:

      .. rst-class:: ansible-option-title

      **vm_timezone**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_timezone" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      timezone set during instance configuration


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"(timezone of control system)"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-workstation_instance--vm_username"></div>

      .. _ansible_collections.rstms_ansible.vmware.workstation_instance_role__parameter-workstation_instance__vm_username:

      .. rst-class:: ansible-option-title

      **vm_username**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-workstation_instance--vm_username" title="Permalink to this option"></a>

      .. ansible-option-type-line::

        :ansible-option-type:`string` / :ansible-option-required:`required`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      instance user account


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"control system user"`

      .. raw:: html

        </div>


.. Attributes


.. Notes


.. Seealso



Authors
^^^^^^^

- Matt Krueger 



.. Extra links

Collection links
~~~~~~~~~~~~~~~~

.. ansible-links::

  - title: "Issue Tracker"
    url: "http://github.com/rstms-ansible/vmware/issues"
    external: true
  - title: "Repository (Sources)"
    url: "http://github.com/rstms-ansible/vmware"
    external: true


.. Parsing errors

