from app.utils.Utils import shell_exec_with_immediate_output

shell_exec_with_immediate_output('source .envrc && python3 app/scripts/getTableCounts.py')
shell_exec_with_immediate_output('source .envrc && python3 app/scripts/getColumnCounts.py')
shell_exec_with_immediate_output('source .envrc && python3 app/scripts/getColumnDefinitions.py')
shell_exec_with_immediate_output('source .envrc && python3 app/scripts/getRowCounts.py')
shell_exec_with_immediate_output('source .envrc && python3 app/scripts/getRowValues.py')
shell_exec_with_immediate_output('source .envrc && python3 app/scripts/getElasticCounts.py')
shell_exec_with_immediate_output('source .envrc && python3 app/scripts/getElasticValues.py')
