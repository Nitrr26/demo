import { EthProvider } from "./contexts/EthContext";
import Intro from "./components/Intro/";
import Setup from "./components/Setup";
import Demo from "./components/Demo";
import "./App.css";

function App() {
  return (
    <EthProvider>
      <div id="App" >
        <div className="container">
          <Intro />
          <hr />
          <p> Hii demo line</p>
          <Setup />
          <hr />
          <Demo />
          <hr />
          </div>
          </div>
   </EthProvider>
  );
}

export default App;
