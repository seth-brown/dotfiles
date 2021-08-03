// properly format a date
const dateOptions = { 
    day: 'numeric',
    month: 'long',
    year: 'numeric'
};

new Date().toLocaleDateString("en-GB", dateOptions);
