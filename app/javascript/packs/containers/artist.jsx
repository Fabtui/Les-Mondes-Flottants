import React from "react";

class Artist extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      artist: null,
      appointments: [],
    };
    this.setData = this.setData.bind(this)
  }

  setData = (data) => {
    console.log(data);
    this.setState({
      artist: data.artist,
      appointments: data.appointments,
    });
  }

  UNSAFE_componentWillMount() {
    fetch(`/api/v1/artists/${this.props.id}`)
      .then((response) => response.json())
      .then((data) => this.setData(data[0]));
  }

  render() {
    console.log('react');
    return (
      <React.Fragment>
        <h3>...</h3>
      </React.Fragment>
    );
  }
}

export default Artist;
