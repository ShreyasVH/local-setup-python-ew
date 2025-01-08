from app.utils.Utils import shell_exec_with_immediate_output

shell_exec_with_immediate_output('python3 app/scripts/getTableCountDiff.py')
shell_exec_with_immediate_output('python3 app/scripts/getColumnCountDiff.py')
shell_exec_with_immediate_output('python3 app/scripts/getColumnDefinitionDiff.py')
shell_exec_with_immediate_output('python3 app/scripts/getRowCountDiff.py')
shell_exec_with_immediate_output('python3 app/scripts/getRowValueDiff.py')
shell_exec_with_immediate_output('python3 app/scripts/getElasticCountDiff.py')
shell_exec_with_immediate_output('python3 app/scripts/getElasticValueDiff.py')
