import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter as Router } from 'react-router-dom';
import { Provider } from 'react-redux';

import './index.css';
import App from './App';
import { store } from './redux/store';
import { registerLicense } from '@syncfusion/ej2-base';

if ('serviceWorker' in navigator) {
  window.addEventListener('load', () => {
    navigator.serviceWorker.register('/service-worker.js')
      .then((registration) => {
        console.log('ServiceWorker registration successful with scope: ', registration.scope);
      }, (error) => {
        console.log('ServiceWorker registration failed: ', error);
      });
  });
}

registerLicense('Ngo9BigBOggjHTQxAR8/V1NCaF5cWWNCf1FpRmJGdld5fUVHYVZUTXxaS00DNHVRdkdnWXhedHVVQmddUUJyXUA=');


ReactDOM.createRoot(document.getElementById('root')).render(

  <React.StrictMode>
    <Provider store={store}>
      <Router>


        <App />


      </Router>
    </Provider>
  </React.StrictMode>,
);
