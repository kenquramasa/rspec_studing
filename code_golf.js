console.log(( s => {
    if (!s.length) return ''
  
    let y = s.reduce((a, b) => a <= b ? a : b)
    y.split('').map((v, i) => {
      for (let x = 0; x <= y.length - i; x++) {
        //   console.log(i);
        let q = y.slice(x, x+i+1)
        console.log(q);
        console.log(s.every(e => e.includes(q)));
        if (s.every(e => e.includes(q))){
            // console.log(q);
            return q
        }
      }
    })
    return ''
  }) (process.argv.slice(2)) )
  