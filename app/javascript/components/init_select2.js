import $ from 'jquery';
import 'select2';


const fetchData = () => {
  var res = []
  const response = {}
  fetch('https://countriesnow.space/api/v0.1/countries')
    .then(response => response.json())
    .then(data => {
      console.log("I'm reading data:")
      var index = 1
      data.data.forEach(element => {
        const entry = {}
        entry["text"] = element.country
        const children = []
        element.cities.forEach(city => {
          const has = {}
          has["id"] = index
          index += 1
          has["text"] = city
          children.push(has)
        })
        entry["children"] = children
        res.push(entry)
      })

    }).then(d => {
      response["results"] = res
      response["pagination"] = { more: true }
      console.log(response)

      $('.select2').select2({
        data: response,
        placeholder: 'This is my placeholder',
        allowClear: true
      })
    })
}




const initSelect2 = () => {

  fetchData()


};

export {initSelect2, fetchData };
