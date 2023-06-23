<script>
export default function isoToStringDate(isoDate) {
    // https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_tolocalestring
    const date = new Date(isoDate)
    return date.toLocaleDateString()
}
</script>
