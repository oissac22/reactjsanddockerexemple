import React from 'react'
import logo from './logo.svg';
import './App.css';


function Paginas({index}){

  switch(index){
    case 'sobre':return <h1>Página Sobre</h1>
    case 'contato':return <h1>Página Contato</h1>
    default:return <h1>Página inicial</h1>
  }

}


function App() {

  const [index, setIndex] = React.useState('');

  return <>
    <div>
      <button onClick={e => setIndex('')}>Home</button>
      <button onClick={e => setIndex('contato')}>Contato</button>
      <button onClick={e => setIndex('sobre')}>Sobre</button>
    </div>
    <Paginas index={index} />
  </>;
}

export default App;
