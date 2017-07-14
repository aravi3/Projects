import React from 'react';

class Clock extends React.Component {
  constructor () {
    super();
    this.state = { time: new Date() };
    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    this.handle = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.handle);
    this.handle = 0;
  }

  tick () {
    const time = new Date();
    this.setState({ time });
  }

  render () {
    return (
      <div className="clock">
        <section>
        <h1>Big Ben</h1>
        <h2>
          <div>Date</div>
          <div>
          { this.state.time.toLocaleString() }
          </div>
        </h2>
        </section>
      </div>
    );
  }
}

export default Clock;
