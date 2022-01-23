import React from 'react';
var HelloWorld = React.createClass({
    render: function () {
        return (
            <h1>Attendance</h1>
        )
    }
});

ReactDOM.render(
    <HelloWorld />,
    document.getElementById('root')
);