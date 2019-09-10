## Install `ansible-tower-cli` Module

To use the tower modules, we need to install `ansible-tower-cli`. Otherwise, we get the below error:

    An exception occurred during task execution. To see the full traceback, use -vvv. The error was: ImportError: No module named tower_cli.utils.exceptions
    fatal: [awx]: FAILED! => {
        "ansible_facts": {
            "discovered_interpreter_python": "/usr/bin/python"
        },
        "changed": false
    }

    MSG:

    Failed to import the required Python library (ansible-tower-cli) on awx's Python /usr/bin/python. Please read module documentation and install in the appropriate location


    PLAY RECAP ***********************************************************************************************************************************************************************************
    awx                        : ok=0    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

## Tower Ansible Modules

These are the tower ansible modules that are commonly used to create new users, inventories, and project templates:

- [tower_user](https://docs.ansible.com/ansible/latest/modules/tower_user_module.html) - create, update, or destroy Ansible Tower user.

- [tower_inventory](https://docs.ansible.com/ansible/latest/modules/tower_inventory_module.html) - create, update, or destroy Ansible Tower inventory.

- [tower_inventory_source](https://docs.ansible.com/ansible/latest/modules/tower_inventory_source_module.html) - create, update, or destroy Ansible Tower inventory source.

- [tower_project](https://docs.ansible.com/ansible/latest/modules/tower_project_module.html) - create, update, or destroy Ansible Tower projects

- [tower_job_template](https://docs.ansible.com/ansible/latest/modules/tower_job_template_module.html) - create, update, or destroy Ansible Tower job template.

- [tower_workflow_template](https://docs.ansible.com/ansible/latest/modules/tower_workflow_template_module.html) - create, update, or destroy Ansible Tower workflow template.

## Tower API URI List

The following is list of the available API calls to AWX:

    Version 2
    GET /api/v2/?format=api
    HTTP 200 OK
    Allow: GET, HEAD, OPTIONS
    Content-Type: application/json
    Vary: Accept
    X-API-Node: awx
    X-API-Time: 0.008s
    {
        "ping": "/api/v2/ping/",
        "instances": "/api/v2/instances/",
        "instance_groups": "/api/v2/instance_groups/",
        "config": "/api/v2/config/",
        "settings": "/api/v2/settings/",
        "me": "/api/v2/me/",
        "dashboard": "/api/v2/dashboard/",
        "organizations": "/api/v2/organizations/",
        "users": "/api/v2/users/",
        "projects": "/api/v2/projects/",
        "project_updates": "/api/v2/project_updates/",
        "teams": "/api/v2/teams/",
        "credentials": "/api/v2/credentials/",
        "credential_types": "/api/v2/credential_types/",
        "credential_input_sources": "/api/v2/credential_input_sources/",
        "applications": "/api/v2/applications/",
        "tokens": "/api/v2/tokens/",
        "metrics": "/api/v2/metrics/",
        "inventory": "/api/v2/inventories/",
        "inventory_scripts": "/api/v2/inventory_scripts/",
        "inventory_sources": "/api/v2/inventory_sources/",
        "inventory_updates": "/api/v2/inventory_updates/",
        "groups": "/api/v2/groups/",
        "hosts": "/api/v2/hosts/",
        "job_templates": "/api/v2/job_templates/",
        "jobs": "/api/v2/jobs/",
        "job_events": "/api/v2/job_events/",
        "ad_hoc_commands": "/api/v2/ad_hoc_commands/",
        "system_job_templates": "/api/v2/system_job_templates/",
        "system_jobs": "/api/v2/system_jobs/",
        "schedules": "/api/v2/schedules/",
        "roles": "/api/v2/roles/",
        "notification_templates": "/api/v2/notification_templates/",
        "notifications": "/api/v2/notifications/",
        "labels": "/api/v2/labels/",
        "unified_job_templates": "/api/v2/unified_job_templates/",
        "unified_jobs": "/api/v2/unified_jobs/",
        "activity_stream": "/api/v2/activity_stream/",
        "workflow_job_templates": "/api/v2/workflow_job_templates/",
        "workflow_jobs": "/api/v2/workflow_jobs/",
        "workflow_job_template_nodes": "/api/v2/workflow_job_template_nodes/",
        "workflow_job_nodes": "/api/v2/workflow_job_nodes/"
    }
