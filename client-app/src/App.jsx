import { useState } from 'react';
import axios from "axios";
import './App.css'
function App() {
  const [value, updateValue] = useState("create new data");
  const [input, setInput] = useState("");
  const baseUrl = "http://192.168.229.130:5001";
  const getDataUrl = `${baseUrl}/data`;
  const createDataUrl = `${baseUrl}/create`;
  const getData = async () => {
    try {
      const { data } = await axios.get(getDataUrl);
      updateValue(data);
      console.log({ message: "got data", data });
      return data;
    } catch (error) {
      console.error({ message: "failed fetching data.", error });
    }
  };

  const handleSubmit = async (evt) => {
    evt.preventDefault();
    await createData(input);
    setInput("");
  };
  const createData = async (inputText) => {
    try {
      const { data } = await axios.post(createDataUrl, { data: inputText });
      console.log({ message: "posted data", data });
      return data;
    } catch (error) {
      console.error({ message: "failed creating data.", error });
    }
  };
  return (
    <>
      <div className="center">
        <form onSubmit={handleSubmit}>
          <h3>Insert data to database: </h3>
          <input
            type="text"
            value={input}
            onChange={(evt) => setInput(evt.target.value)}
            placeholder="Your Data.." required
          />
          <input type="submit" value="Submit data" className="button"/>
        </form>

        <h3>Get data from database: </h3>
        <button onClick={getData} style={{ margin: "1rem 0" }} className="button2">
          Get data
        </button>
        <p>value: </p> 
        <pre>{JSON.stringify(value, null, 2)}</pre>
      </div>
    </>
  )
}

export default App
