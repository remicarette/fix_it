import React from 'react';

const SignInPage = () => {
  return (
    <div className="container">

      <h2 className="text-center">Merci de vous connecter</h2>
      <FormGroup>
        <Label value="Votre email" />
        <Input />
      </FormGroup>

      <FormGroup>
        <Label value="Votre password" />
        <Input />
      </FormGroup>

      
    </div>
  )
}

const Label = ({value}) => {
  return <label>{value}</label>
}

const Input = () => {
  return <input className="form-control" />
}

const FormGroup = ({ children }) => {
  return <div class="form-group">
    { children }
  </div>
}

export default SignInPage;