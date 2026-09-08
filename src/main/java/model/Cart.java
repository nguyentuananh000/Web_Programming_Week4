package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<Item> items = new ArrayList<>();

    public List<Item> getItems() { return items; }

    public void addItem(Product p) {
        for (Item item : items) {
            if (item.getProduct().getCode().equals(p.getCode())) {
                item.setQuantity(item.getQuantity() + 1);
                return;
            }
        }
        items.add(new Item(p, 1));
    }

    public void updateQuantity(String code, int quantity) {
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getProduct().getCode().equals(code)) {
                if (quantity <= 0) items.remove(i);
                else items.get(i).setQuantity(quantity);
                return;
            }
        }
    }

    public void removeItem(String code) {
        items.removeIf(item -> item.getProduct().getCode().equals(code));
    }
}