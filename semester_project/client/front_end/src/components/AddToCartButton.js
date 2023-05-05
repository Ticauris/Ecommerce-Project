import './AddToCartButton.css'
import { Button} from "react-bootstrap";
function AddToCartButton(props) {
  const { addItem, productId } = props;
  return (
    <Button onClick={() => addItem(productId)}>Add to cart</Button>
  );
}


export default AddToCartButton;

/**import "./list_products.css"; */