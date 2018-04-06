baseline
baseline: spec
	<baseline>
	spec
		for: #'common'
		do: [
			spec 
				package: 'ForthS-Compiler';
				package: 'ForthS-Core' with: [ spec requires: 'ForthS-Compiler' ];
				package: 'ForthS-Object' with: [ spec requires: 'ForthS-Core' ];
				package: 'ForthS-Example' with: [ spec requires: 'ForthS-Object'];
				yourself ]