as yet unclassified
baseline: spec
    <baseline>
    spec
        for: #common
        do: [ 
            spec
                package: 'HTTP2'.
            spec
                group: 'default' with: #('HTTP2');
                group: 'tests' with: #('HTTP2') ]